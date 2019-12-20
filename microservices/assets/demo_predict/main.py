import json
import logging

from flask import Flask, request, Response

from src.model import PredictModel

handlers = [logging.StreamHandler()]
logging.basicConfig(handlers=handlers, format='%(levelname)s:%(message)s', level=logging.INFO)

app = Flask(__name__)
model = PredictModel()
logging.info(model)


@app.route('/api/v1/predict', methods=['POST'])
def predict():
    data = request.json
    logging.info(data)
    label = model.predict(data["input"])
    logging.info(label)
    output_data = {"prediction": label[0]}
    response = Response(json.dumps(output_data), mimetype='application/json')
    return response


if __name__ == '__main__':
    app.run(port=80, debug=True, host='0.0.0.0')
