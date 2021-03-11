import os
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.neighbors import KNeighborsClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn import model_selection
import joblib

ROOT = os.path.dirname(os.path.abspath(__file__))

# READ DATA ===================================================================
PATH_DATA = os.path.join(ROOT, "Churn.csv")
df = pd.read_csv(PATH_DATA, sep=";")    
# =============================================================================


# CREATE DUMMY ================================================================
FACTOR_COLUMNS = ["Int'l Plan", "VMail Plan"]
df = pd.get_dummies(df, columns=FACTOR_COLUMNS, drop_first=True)
# =============================================================================

# SUBSET ======================================================================
SUBSET = ['Account Length','VMail Message','Day Mins','Eve Mins','Night Mins','Intl Mins',
          'CustServ Calls', 'Churn', "Int'l Plan_1",'VMail Plan_1','Day Calls','Day Charge',
          'Eve Calls','Eve Charge', 'Night Calls', 'Night Charge','Intl Calls','Intl Charge']
df = df[SUBSET]
df.to_excel(os.path.join(ROOT, "models", "cleaned_data.xlsx"), index = False)
# =============================================================================

# TRAIN & VALIDATION SPLIT ====================================================
y = df["Churn"]
X = df.drop(["Churn"], axis=1)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42)
# =============================================================================


# =============================================================================
models = []
models.append(('Logistic_Regression', LogisticRegression(solver='liblinear')))
models.append(('SVC', SVC(kernel = 'linear', probability=True)))
models.append(('Kernel_SVM', SVC(kernel = 'rbf', probability=True)))
models.append(('KNN', KNeighborsClassifier(n_neighbors = 5, metric = 'minkowski', p = 2)))
models.append(('Gaussian_NB', GaussianNB()))
models.append(('Decision_Tree_Classifier', DecisionTreeClassifier(criterion = 'entropy')))
models.append(('Random_Forest', RandomForestClassifier( n_estimators=100, criterion = 'entropy')))

#Evaluating Model Results:
acc_results = []
auc_results = []
names = []
# set table to table to populate with performance results
col = ['Algorithm', 'ROC AUC Mean', 'ROC AUC STD', 'Accuracy Mean', 'Accuracy STD']
model_results = pd.DataFrame(columns=col)
i = 0
# Evaluate each model using k-fold cross-validation:
for name, model in models:
    kfold = model_selection.KFold(n_splits=5)
    # accuracy scoring:
    cv_acc_results = model_selection.cross_val_score(  
        model, X_train, y_train, cv=kfold, scoring='accuracy')
    # roc_auc scoring:
    cv_auc_results = model_selection.cross_val_score(  
        model, X_train, y_train, cv=kfold, scoring='roc_auc')
    acc_results.append(cv_acc_results)
    auc_results.append(cv_auc_results)
    names.append(name)
    model_results.loc[i] = [name,
                            round(cv_auc_results.mean()*100, 2),
                            round(cv_auc_results.std()*100, 2),
                            round(cv_acc_results.mean()*100, 2),
                            round(cv_acc_results.std()*100, 2)
                            ]
    i += 1
    
model_results = model_results.sort_values(by=['ROC AUC Mean'], ascending=False)
model_results.to_excel(os.path.join(ROOT, "models", "summary.xlsx"), index = False)
# =============================================================================

# STORE MODELS ================================================================
MODELS_DIR = os.path.join(ROOT, "models")
for name, model in models:
    PATH_MODEL = os.path.join(MODELS_DIR, name)
    if not os.path.isdir(PATH_MODEL):
        os.mkdir(PATH_MODEL)
    classifier = model.fit(X_train, y_train)
    joblib.dump(classifier, os.path.join(PATH_MODEL, 'model.joblib'))
# =============================================================================

