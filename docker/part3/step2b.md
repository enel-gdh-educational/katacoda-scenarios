### Add a container to a network
You can add a container to an existing docker network in the creation step of the container,
using the parameters `--network`

With the following commands you can run the container of Dockerchurn adding it to a network.
First check that you have `dockerchurn` image in your local environment

`docker images | grep dockerchurn`{{execute}}

If you don't have the image built getting an empty output, you can find source code with dockerfile in folder `project/step2c`
and build image with command that you have seen in the previous lessons

`cd project/step2c`{{execute}}

`docker build -t dockerchurn .`{{execute}}

Then run container adding it to the docker network that you have just created in the previous steps:

`docker run -d -p 8080:80 --name dockerchurn-container --network=course_net  dockerchurn`{{execute}}

Test the correcting execution using `docker ps` command or this curl:

`curl -X POST "http://localhost:8080/Random%20Forest/predict" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"Account_Length\":102,\"VMail_Message\":8,\"Day_Mins\":179.1,\"Eve_Mins\":200.7,\"Night_Mins\":201,\"Intl_Mins\":10.2,\"CustServ_Calls\":1,\"Int_l_Plan_1\":0,\"VMail_Plan_1\":0,\"Day_Calls\":100,\"Day_Charge\":30.4,\"Eve_Calls\":100,\"Eve_Charge\":17.1,\"Night_Calls\":100,\"Night_Charge\":9.5,\"Intl_Calls\":4,\"Intl_Charge\":2.7}"`{{execute}}

You can check that this container is executing inside the network using inspect:

`docker network inspect course_net`{{execute}}

Now stop and delete the running container and add container to the network after the `docker run`
command:

`docker stop dockerchurn-container; docker rm dockerchurn-container`{{execute}}

The network at this moment has no containers. Then we run the container without `--network`
parameter

`docker run -d -p 8080:80 --name dockerchurn-container dockerchurn`{{execute}}

You can use the command `docker network connect` to add container to a network at runtime

`docker network connect course_net dockerchurn-container`{{execute}}

You can check that you got the same results using `docker network inspect` command

`docker network inspect course_net`{{execute}}

Of course, you can also remove the container from the network at runtime with the following command

`docker network disconnect course_net dockerchurn-container`{{execute}}

Then check the output using inspect:

`docker network inspect course_net`{{execute}}

