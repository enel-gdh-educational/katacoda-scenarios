import logging
import schedule
import xgboost
import pandas
import random
import os
import pickle

from sklearn.metrics import accuracy_score
from sklearn.preprocessing import LabelEncoder


class TrainModel:
    def __init__(self):
        self.model = None
        if not os.path.exists("/etc/models"):
            os.mkdir("/etc/models")

    def train_once(self):
        self.train()
        return schedule.CancelJob

    def train(self):
        dataframe = self.load_data(path="iris.csv")
        print(dataframe.head(20))
        X, Y = self.create_dataset(loaded_data=dataframe)
        encoder = LabelEncoder()
        target = encoder.fit_transform(Y)
        self.save_model(model=encoder, path='/etc/models/encoder.pkl')
        index = self.rand_index(target.shape[0])
        train_index, val_index, test_index = self.split_train_val_test_index(index, 0.7, 0.2, 0.1)
        input_train, input_val, input_test = self.select_by_shuffle_index(X, train_index, val_index, test_index)
        target_train, target_val, target_test = self.select_by_shuffle_index(target, train_index, val_index, test_index)
        self.train_model(input_train, target_train, input_val, target_val)
        self.evaluate(input_test, target_test)
        self.save_model(model=self.model, path='/etc/models/classifier.pkl')
        logging.info("Training finished")

    def load_data(self, path):
        return pandas.read_csv(path)

    def create_dataset(self, loaded_data):
        dataset = loaded_data.values
        X = dataset[:, 0:4].astype(float)
        Y = dataset[:, 4]
        return X, Y

    def rand_index(self, dim):
        k = [i for i in range(0, dim)]
        random.shuffle(k)
        return k

    def split_train_val_test_index(self, index, train_ratio=0.7, val_ratio=0.2, test_ratio=0.1):
        train_dim = round(len(index) * train_ratio)
        val_dim = round(len(index) * (train_ratio + val_ratio))
        test_dim = round(len(index) * test_ratio)
        return index[0:train_dim], index[train_dim:val_dim], index[-test_dim:]

    def select_by_shuffle_index(self, array, train_index, val_index, test_index):
        return array[train_index], array[val_index], array[test_index]

    def train_model(self, input_train, target_train, input_val, target_val):
        self.model = xgboost.XGBClassifier()
        self.model.fit(input_train, target_train, eval_set=[(input_val, target_val)], eval_metric='mlogloss',
                       early_stopping_rounds=50)

    def evaluate(self, input_test, target_test):
        y_pred = self.model.predict(input_test)
        accuracy_test = accuracy_score(target_test, y_pred)
        logging.info('Test accuracy: %f' % accuracy_test)

    def save_model(self, model, path):
        with open(path, "wb") as f:
            pickle.dump(model, f)
        logging.info("Saved %s" % path)
