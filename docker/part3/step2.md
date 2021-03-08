# Docker Network
You can use a Docker network to connect containers together.

You can create a network using this command

`docker network create [OPTIONS] NETWORK`

For this course step the goal is creating a new docker container connected to the Docker Churn
Model that you have used in the second part of the course

First you create a custom network with name course_net

`docker network create -d bridge course_net`{{execute}}

You can see the list of network in your docker environment using this command:

`docker network ls`{{execute}}

In particular for each network of the list we have a recap of most important details about the
newtwork:
- **name**: alias of the network just created
- **network** id: network hash identifier
- **scope**: it is the target environment of the network. For this purpose to connect containers running
  in a local environment, we have always the keyword local  
- **driver**: it describes the type of network driver that is the component that provides core network
  functionality to the containers. **Bridge** is the default type of network
  you are creating if you don't specify the driver. Bridge networks are usually used when
  your applications run in standalone containers that need to communicate each others.

You can get useful information about docker network using the inspect command. Let's try to get
information about the network that you have just created

`docker network inspect course_net`{{execute}}

The output contains the following useful information:
- **Name**: it's the name of the network
- **Id**: the unique id that identifies the network
- **timestamp** of creation
- **driver**: type of network driver
- **Containers**: list of containers in the network inspected; this value is useful for debug purpose



### Add a container to a network
You can add a container to an existing docker network in the creation step of the container,
using the parameters --network

With the following commands you can run the container of Dockerchurn adding it to a newtork.
First check that you have dockerchurn image in your local environment

`docker images | grep dockerchurn`{{execute}}

Then run container adding it to the docker network that you have just created in the previous steps:

`docker run -d -p 8080:80 --name dockerchurn-container --network=course_net  dockerchurn`{{execute}}

You can check that containers is executing inside the network using inspect:

`docker network inspect course_net`{{execute}}

Now stop and delete the running container and add container to the network after the `docker run`
command:

`docker stop dockerchurn-container; docker rm dockerchurn-container`

The newtwork at this moment has not containers. Then we run the container without `--network`
parameter

`docker run -d -p 8080:80 --name dockerchurn-container dockerchurn`{{execute}}

You can use the command `docker network connect` to add container to a network a runtime

`docker network connect course_net dockerchurn-container`{{execute}}

You can check that you got the same results using `docker network inspect` command

`docker network inspect course_net`{{execute}}

Of course you can remove the container from the network at runtime with the following command

`docker network disconnect course_net dockerchurn-container`{{execute}}

Then check the output effect using inspect:

`docker network inspect course_net`{{execute}}


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
container that you want to connect

-- INTERACTIVE --
aprire dockerfile e mostrare puntamenti del microservice chiamato

Pull the image of the new microservice and run it.

-- INTERACTIVE --
pull/push immagine container frontend

-- INTERACTIVE --
run container

If you don't specify the network you can get an error when the frontend microservice try to 
call the model container

-- INTERACTIVE --
chiamata al primo container

You can fix this error including all the containers in the same network. You get the ip using the
inspection command or the label name of container

-- INTERACTIVE
docker connect per aggiungere i container alla rete




