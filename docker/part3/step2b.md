### Add a container to a network
You can add a container to an existing docker network in the creation step of the container,
using the parameters `--network`

With the following commands you can run the container of Dockerchurn adding it to a newtork.
First check that you have dockerchurn image in your local environment

`docker images | grep dockerchurn`{{execute}}

If you don't have the image built you can find source code with dockerfile in folder `project/step2c`
and build image with command that you have seen in the previous lessons

`cd project/step2c`{{execute}}

`docker build -t dockerchurn .`{{execute}}

Then run container adding it to the docker network that you have just created in the previous steps:

`docker run -d -p 8080:80 --name dockerchurn-container --network=course_net  dockerchurn`{{execute}}

You can check that this container is executing inside the network using inspect:

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

