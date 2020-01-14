import requests

url = 'http://*****:8083/api/v1/predict'
data = {"input": [1, 2, 4, 5]}

response = requests.post(url, json=data)
print(response)
print(response.json())
