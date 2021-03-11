# Docker Compose Introduction

Docker Compose allows you to define and running multiple containers using a yaml file configuration.
With a single command in terminal you can start and stop different containers that share the same network
or resources.

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
- running containers
- volumes
- networks

For each resource you must add a new section in docker compose file.

First delete the old containers of previous steps and then
create the configuration file in the root directory of project `project/step2c`.

`docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)`{{execute}}

Move to root project:

`cd project/step2c`{{execute}}

then create an empty docker-compose

`touch docker-compose.yml`{{execute}}

Now we add the following lines with visual text editor or `vim` (you can find this configuration
also in the file `docker-compose-temp1.yml` in the root project directory:

```
version: "2.2"
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
scenario you need building images from source code seen in the previous steps:
  - `dockerchurn`: the backend service built from Dockerfile in the root directory (`build: .`)
  - `dockerchurn-fe`: the frontend servicebuilt from Dockerfile in the frontend folder
    directory (`build: ./frontend`)
    
- `ports`: In `ports` field there is the value of port mapping that you used in `docker run`
command with the parameter `-p`
  
- `container_name`: this is the container name that Docker Compose create when start the
application
  
- `environment`: in this section you can insert environment input variable for the container.
In this specific scenario the frontend service need the host name and port of the backend service

  
At the end of this step let's try this configuration starting the application with the following
command

`docker-compose up -d`{{execute}}

The first time this operation requires several minutes since you have to build
all the images for the containers that you defined in configuration file.

As you can see from the output, Docker has done the following steps automatically:
1. build image of the frontend and backend services
2. starts container using the specified port mapping, environment variables and container names

You can check the result using this command:

`docker ps`{{execute}}

or use this command to get logs

`docker-compose logs`{{execute}}

Using this command you can stop all the containers:

`docker-compose stop`{{execute}}

It is worth noting that the application is not working yet, because you must add network resource
