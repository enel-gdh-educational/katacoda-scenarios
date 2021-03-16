import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output
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
msg_dash = ""
series_out = [0, 0]

app.layout = html.Div(children=[
  html.H1(children='Dockerchurn Model'),

  html.Div(children=msg_dash),

  html.Button(
      id='button',
      children='Update',
      n_clicks=0
  ),


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


@app.callback(Output('example-graph', 'figure'), [Input('button', 'n_clicks')])
def update_graph(n_clicks):
  series_out_call = [0, 0]
  title = "Press Update Button to start prediction"

  try:
    if n_clicks > 0:
      response = requests.post(query_url, json=data_json_in, timeout=1200)
      resp_json = response.json()
      series_out_call = resp_json['probability']
      title = f"Probability Response Visualization for model: {resp_json['prediction']}"
      print(f"response json from server: {resp_json}")

  except Exception as e:
    title = f"An error occurred during the connection: {str(e)}"
    print(f"Exception during retrieve {str(e)}")

  return {
    'data': [
      {'x': [1, 2], 'y': series_out_call, 'type': 'bar', 'name': 'Probability'}
    ],
    'layout': {
      'title': title
    }
  }


if __name__ == '__main__':
  app.run_server(host='0.0.0.0', port=8081, debug=True)
