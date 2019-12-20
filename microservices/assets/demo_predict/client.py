import requests

url = 'http://127.0.0.1:80/api/v1/predict'
data = {"input": [1, 2, 4, 5]}

response = requests.post(url, json=data)
print(response)
print(response.json())
