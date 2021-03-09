# Docker Network

### Add a container to a network
You can add a container to an existing docker network in the creation step of the container,
using the parameters `--network`

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

