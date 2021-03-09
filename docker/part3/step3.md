# Docker Compose
Docker Compose allows you to define and running multiple containers using a yaml file configuration.
With a single command in CLI you can start and stop different containers that share the same network
or resource.

Using Docker Compose you can easily deploy in local environment all the resources you need to test
your application. For example, you can create volumes, network or running containers defining them in 
yaml configuration file.

Compose has commands for managing the whole lifecycle of your application:
- Start and rebuild services
- View the status of your services
- Getting logs of running services

### Creating services
The first step is creating the configuration file for your environment. Let's try to create a compose
file for the project that you have just deployed in the previous steps

You need to create the following resources:
- volume containers
- network
- running containers

For each resources you have to add a new section in docker compose file.

First create the configuration file in the root directory of project

`touch docker-compose.yml`{{execute}}

then we add the following lines:

```
version: "3.9"
services:
  dockerchurn:
    build: .
    ports:
      - "8080:80"
    container_name: dockerchurn-container
  dockerchurn-fe:
    build: ./frontend
    ports:
      - "8081:8081"
    container_name: dockerchurn-container-fe
    environment:
      - HOST=dockerchurn-container
      - PORT=80
```
 In this step you are including:
- `services`: Services are docker containers that compose your application. You can include
containers from images in Dockerhub or you can build your own image using Dockerfile. In this 
scenario you build image from source code of the previous step
  - `dockerchurn`: the backend service built from Dockerfile in the root directory (`build: .`)
  - `dockerchurn-fe`: the frontend servicebuilt from Dockerfile in the frontend folder
    directory (`build: ./frontend`)
    
- `ports`: In `ports` field there is the value of port mapping that you used in `docker run`
command ith the parameter `-p`
  
- `container_name`: this is the container name that Docker Compose create when start the
application
  
- `environment`: in this section you can insert environment input variable for the container.
In this specific scenario the frontend service need the host name and port of the backend service

  
At the end of this step let's try this configuration starting the application with the following
command

`docker-compose up -d`{{execute}}

As you can see from the output Docker has done the following steps automatically:
1. build image of the frontend and backend services
2. starts container using the specified port mapping, environment variables and container names

You can check the result using this command:

`docker ps`{{execute}}

Using this command you can stop all the containers:

`docker-compose stop`

### Creating volumes

To start correctly your application you need also volume for the model of backend service.
You can add this resources in docker-compose.yml

First define the volume name at the end of file. For this application we use the names `models-vol`

```
volumes:
  models-vol:
```

Then bind the defined module under the section of the backend container `dockerchurn`

```
...
volumes:
  - type: volume
    source: models-vol
    target: /app/models    
...
```

With this configuration you define:
- `source`: this is the name of the volume defined in configuration file
- `target`: this is the target path that you want to mount inside persistent volume; for this case
you can use `/app/module` which is the folder containing all input modules used by application
  

Now start you application 

`docker-compose up -d`{{execute}}

You can check the correct creation of the volume with this command 

`docker volume ls`{{execute}}

Check also the correct bind of the volume mounted using the inspection on container. In particular
in the `Mounts` section you can get information about name of the volume and target folder
specified in the docker-compose.yml

`docker inspect dockerchurn`{{execute}}

### Creating network

At this step, the application is not working yet because you miss the network configuration

Let's add in docker compose configuration file this resource. First you should 
define the `course_net`
network at the end of docker-compose

```
networks:
  course_net:
```

Then you must bind the two services to the network just defined. Here an example for `dockerchurn`
service

```
services:
  dockerchurn:
    build: .
    networks:
      - course_net
      ...
```

Finally, you need to specify a dependency between the tho services. In particular the frontend
service need that backend service is correctly running so that the api call is working. 
For this you must add the `depends_on` field

```
dockerchurn-fe:
  depends_on:
    - "dockerchurn"
```


After that you have the correct final version of docker-compose. Start the application and
check the results in the dashboard

`docker-compose up -d`{{execute}}

Check that network is created correctly with containers correctly bound

`docker network ls`{{execute}}

`docker network inspect dockerchurn_course_net`{{execute}}
 

At the end use this command to delete containers and network just created

`docker-compose down`{{execute}}

To remove also the volume, add the `--volumes` parameter

`docker-compose down --volumes`{{execute}}