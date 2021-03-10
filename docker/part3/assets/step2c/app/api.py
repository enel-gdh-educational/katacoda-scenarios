from fastapi import FastAPI, Query
from joblib import load
from pydantic import  BaseModel
import os

# GET ROOT
ROOT = os.path.dirname(os.path.abspath(__file__))
MODEL_PATH = os.path.join(ROOT, "models")

# LOAD MODELS
MODEL_LIST = {
    'Decision Tree Classifier': load(os.path.join(MODEL_PATH, 'Decision Tree Classifier', 'model.joblib')),
    'Gaussian NB': load(os.path.join(MODEL_PATH, 'Gaussian NB', 'model.joblib')),
    'Kernel SVM': load(os.path.join(MODEL_PATH, 'Kernel SVM', 'model.joblib')),
    'KNN': load(os.path.join(MODEL_PATH, 'KNN', 'model.joblib')),
    'Logistic Regression': load(os.path.join(MODEL_PATH, 'Logistic Regression', 'model.joblib')),
    'Random Forest': load(os.path.join(MODEL_PATH, 'Random Forest', 'model.joblib')),
    'SVC': load(os.path.join(MODEL_PATH, 'SVC', 'model.joblib')),
}

# PREDICTION RETURN
def get_prediction(clf, params):    
    x = [list(params.values())]
    y = clf.predict(x)[0]  # just get single value
    prob = clf.predict_proba(x)[0].tolist()  # send to list for return
    return {'prediction': int(y), 'probability': prob}


# INITIATE API
app = FastAPI(title="Prediction API", docs_url="/", version="1.0.0")

# DEFINE MODEL FOR POST
class ModelParams(BaseModel):
    Account_Length: int = Query(102, description='Count, how long account has been active')
    VMail_Message: int = Query(8, description='Count, number of voice mail messages')
    Day_Mins: float = Query(179.1, description='Continuous, minutes customer used service during the day')
    Eve_Mins: float = Query(200.7, description='Continuous, minutes customer used service during the evening')
    Night_Mins: float = Query(201.0, description='Continuous, minutes customer used service during the night')
    Intl_Mins: float = Query(10.2, description='Continuous, minutes customer used service to make international calls')
    CustServ_Calls: int = Query(1, description='Count, number of calls to customer service')
    Int_l_Plan_1: bool = Query(0, description='Boolean, presence of international plan.')
    VMail_Plan_1: bool = Query(0, description='Boolean, presence of voice mail plan')
    Day_Calls: int = Query(100, description='Count, total number of calls during the day')
    Day_Charge: float = Query(30.4, description='Continuous, total charge during the day')
    Eve_Calls: int = Query(100, description='Count, total number of calls during the evening')
    Eve_Charge: float = Query(17.1, description='Continuous, total charge during the evening')
    Night_Calls: int = Query(100, description='Count, total number of calls during the night')
    Night_Charge: float = Query(9.5, description='Continuous, total charge during the night')
    Intl_Calls: int = Query(4, description='Count, total number of international calls')
    Intl_Charge: float = Query(2.7, description='Continuous, total international charge')


@app.get("/health")
def healthcheck():
    return {"health": True}

@app.post("/{model}/predict")
def predict(model:str, params: ModelParams):
    params = params.dict()
    if model not in MODEL_LIST:
        return {'Error' : f'The model you choose is not in list. The model in list are: {", ".join(MODEL_LIST.keys())}'}
    else:
        clf = MODEL_LIST[model]
        pred = get_prediction(clf, params)
    return pred