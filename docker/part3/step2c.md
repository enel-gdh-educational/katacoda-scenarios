# Docker Network

### Connect multiple containers
In this section you can test and check all the features and advantages of docker newtork
when you need to connect multipe connecting

First check that the model container `dockerchurn-container` is running inside the `course_net`.
Check that container is running:

`docker ps | grep dockerchurn-container`{{execute}}

and check the network status

`docker network inspect course_net`{{execute}}


Suppose you need a frontend service that calls the container model to get the last prediction data.
In this microservice you can see a property where you set the host and port of the
container that you want to connect.

For this purpose we have created a simple script using Dash Framework (see
https://dash.plotly.com/introduction for more details). Dash is Python framework for building 
web applications. It built on top of Flask, Plotly.js, React and React Js.
It enables you to build dashboards using pure Python. Dash is open source,
and its apps run on the web browser. 

You can find the frontend code folder DockerChurn/frontend. It has:
- fe.py: it is the python script that contains code to run the server, fetch data from api model,
show dashboard with results of prediction
- Dockerfile: it is the dockerfile to build the image needed to run the container

The python script runs these steps:
1. variabile initializations: the backend model `HOST` and `PORT` come from environment
variables, set with `docker run` commands
   
2. call to model dashboard using the host and port at the previous step; for this testing
purpose we use the "Random Forest model" with this POST API 
   `http://{HOST}:{PORT}/Random%20Forest/predict"`. This is the expected json output for this call
   
```
{
  "prediction": 0,
  "probability": [
    0.96,
    0.04
  ]
}
```
   
3. If the result of the call is ok, the page will show a message with the value of the
field `predictions` and a histogram graph with the two values of field `probability`
   (0,96 and 0,04 for this model loaded)
   
4. If the result of the call is ko the page will show an error message and an empty histogram 
with no values
   
This is an example of the dashboard where you can find all the elements described

--IMMAGINE_DA_INSERIRE--

First you build the image with the name `dockerchurn-fe`

`docker build -t dockerchurn-fe ./frontend`{{execute}}

Then run the container using the command

`docker run -d -p 8081:8081 --name dockerchurn-fe-container --env HOST=dockerchurn-container --env PORT=80 dockerchurn-fe`{{execute}}

Connecting to the browser at port 8081 you can see an error on the dashboard. This is because
the frontend containers has not been included in the same network of bakend. In this way
the two containers live and run in different and isolated environment


You can fix this error including all the containers in the same network. You get the ip using the
inspection command or the label name of container. First we stop and delete the frontend:

`docker stop dockerchurn-fe-container`{{execute}}

`docker rm dockerchurn-fe-container`{{execute}}

Then you must run the frontend container using the `--network` parameter, including it in
`course_net` network created in the previous step

`docker run -d -p 8081:8081 --name dockerchurn-fe-container --network=course_net --env HOST=dockerchurn-container --env PORT=80 dockerchurn-fe`{{execute}}

This time you don't get any error and you can see the dashboard with histogram graph with data
fetched from backend container `dockerchurn`

It is worth noting that using docker network, Docker resolves the container alias specified in
command `docker run` with ip that network has assigned to the container.
So this test will work also if you use the ip directly taken from command `docker network inspect`

