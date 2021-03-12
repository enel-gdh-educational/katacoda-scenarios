# Docker Network

### Basic Commands


You can use a Docker network to connect containers together.

You can create a network using this command

`docker network create [OPTIONS] NETWORK`

For this course step the goal is creating a new docker container connected to the Docker Churn
Model that you have used in the second part of the course.

First you create a custom network with name `course_net`

`docker network create -d bridge course_net`{{execute}}

You can see the list of network in your docker environment using this command:

`docker network ls`{{execute}}

In particular for each network of the list we have a recap of most important details about
networks:
- **name**: alias of the network just created
- **network id**: network hash identifier
- **scope**: it is the target environment of the network. For this purpose to connect containers running
  in a local environment, we have always the keyword `local`  
- **driver**: it describes the type of network driver that is the component that provides core network
  functionality to the containers. `Bridge` is the default type of network
  you are creating if you don't specify the driver. Bridge networks are usually used when
  your application is composed by standalone containers that need to communicate each others.

You can get useful information about docker network using the inspect command. Let's try to get
information about the network that you have just created

`docker network inspect course_net`{{execute}}

The output contains the following useful informations:
- **Name**: it's the name of the network
- **Id**: the unique id that identifies the network
- **timestamp** of creation
- **driver**: type of network driver
- **Containers**: list of containers in the network inspected; this value is useful for debug purpose
