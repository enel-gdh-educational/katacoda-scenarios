import dash
import dash_core_components as dcc
import dash_html_components as html
import requests
import os

# get environment variables
HOST = os.environ['HOST']
PORT = os.environ['PORT']

print(f"Host: {HOST}")
print(f"Port: {PORT}")


external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']
query_url = f"http://{HOST}:{PORT}/Random%20Forest/predict"
data_json_in = {
  "Account_Length": 102,
  "VMail_Message": 8,
  "Day_Mins": 179.1,
  "Eve_Mins": 200.7,
  "Night_Mins": 201,
  "Intl_Mins": 10.2,
  "CustServ_Calls": 1,
  "Int_l_Plan_1": 0,
  "VMail_Plan_1": 0,
  "Day_Calls": 100,
  "Day_Charge": 30.4,
  "Eve_Calls": 100,
  "Eve_Charge": 17.1,
  "Night_Calls": 100,
  "Night_Charge": 9.5,
  "Intl_Calls": 4,
  "Intl_Charge": 2.7
}

app = dash.Dash("name dashboard", external_stylesheets=external_stylesheets)

# get data from dockerchurn model
msg_dash = ""
series_out = [0, 0]
try:
  response = requests.post(query_url, json=data_json_in, timeout=1200)
  resp_json = response.json()
  msg_dash = f"Output for prediction: {resp_json['prediction']}"
  series_out = resp_json['probability']
  print(f"response json from server: {resp_json}")
except Exception as e:
  print(f"Exception during retrieve {str(e)}")
  msg_dash = f"Error fetch data {str(e)}"


app.layout = html.Div(children=[
  html.H1(children='Dockerchurn Model'),

  html.Div(children=msg_dash),

  dcc.Graph(
    id='example-graph',
    figure={
      'data': [
        {'x': [1, 2], 'y': series_out, 'type': 'bar', 'name': 'Probability'}
      ],
      'layout': {
        'title': 'Probability Response Visualization'
      }
    }
  )
])

if __name__ == '__main__':
  app.run_server(host='0.0.0.0', port=8081, debug=True)
