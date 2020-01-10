import pickle


class PredictModel:
    def __init__(self, model_path="/etc/models/classifier.pkl", encoder_path="/etc/models/encoder.pkl"):
        self.model = None
        self.encoder = None
        self.model_path = model_path
        self.encoder_path = encoder_path
        if not self.model:
            self.model = self.load_model(self.model_path)
        if not self.encoder:
            self.encoder = self.load_model(self.encoder_path)

    def load_model(self, path):
        with open(path, "rb") as f:
            return pickle.load(f)

    def predict(self, my_array):
        prediction = self.model.predict(my_array)
        return self.encoder.inverse_transform(prediction)
