# Let's use containers!

Now that we learned some basic concepts, let's start experimenting with Docker and Containers!

---

## docker run command

The first command we need to start using containers is `docker run`. 

Usage: `docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]`

The docker run command must specify an IMAGE to derive the container from. With the docker run [OPTIONS] you can extend or override the image defaults set by the developer. Additionally, you can override nearly all the defaults set by the Docker run-time. 

---

Every journey in IT starts with a Hello World, so run:
`docker run --name hello hello-world`{{execute}} 

The output of the container tells us what happened.

```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub. (amd64)
 3. The Docker daemon created a new container from that image which runs the executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it to your terminal.
```

Let's explain these steps.

### 1. Docker client and Docker daemon
The Docker client is the Docker command line tool. We can use it to interact with Docker.

Docker Client is the persistent process that manages containers. We interact with it through the docker client (CLI).

### 2. Images and Docker Hub
Container images are one of the most important elements when working with Docker. Someone can confuse Docker containers and Docker images, so let's explain the difference.

An **image** is a model used to create one or more containers. It's a static element, and it isn't directly executed.

A **container** is a running entity, created from an image i.e. from one image, we can create more containers.

So Docker, to create our "hello world" container used the "hello-world" image. But where did Docker find it? Answer: in Docker Hub. It's a public registry that contains Docker images ready to be executed. Docker Hub is the public registry of Docker, but there are also private registries. These public registries usually contains base images that can be used to package our applications. For example there are images for Ubuntu, PostgreSQL, MongoDB, Kafka, and Python.

### Docker client VS Docker deamon VS Docker Registry
Docker uses a client-server architecture. The Docker client talks to the Docker daemon, which does the heavy lifting of building, running, and distributing your Docker containers. The Docker client and daemon can run on the same system, or you can connect a Docker client to a remote Docker daemon. The Docker client and daemon communicate using a REST API, over UNIX sockets or a network interface. Another Docker client is Docker Compose that lets you work with applications consisting of a set of containers. A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use. Docker is configured to look for images on Docker Hub by default. You can even run your own private registry.

![Docker architecture](https://docs.docker.com/engine/images/architecture.svg)

### 3. Run the container
At this point Docker created and executed the container. This is because we told it to do it. We executed `docker run` command. 

"Docker run" is used to execute containers. It must have an *IMAGE* specified to derive the container from.

### 4. Stream output
The Docker daemon streams the output of your container to the Docker client. It's the default behavior, but you can always override it.

---
## docker ps command

Now, we have executed our first container. To see all running containers we can use the `docker ps` command.

Usage: `docker ps [OPTIONS]`

Some important and useful options are:
- `--all , -a` Show all containers (default shows just running)
- `--filter , -f` Filter output based on conditions provided
- `--format` Pretty-print containers using a Go template
- `--last , -n` Show n last created containers (includes all states)

So, to see all running containers execute: `docker ps`{{execute}} 

We have zero containers running, and it's exactly because our container started, executed something and exited. To see **all** containers, in every status, run:
`docker ps -a`{{execute}}
Here we can see our hello-world container with "Exited" status. 

## docker image command
We told before the difference between container and images. As we have commands to manage containers, we also have commands to manage images. The `docker image` commands allow us to list local images, delete them and so on.

We can list all the locally available images with the command `docker image ls`{{execute}}

We can see that we have the "hello-world" image pulled but the relationship between images and container is not 1:1, so we can create another container named "hello2" with this command
`docker run --name hello2 hello-world`{{execute}} 

We can observe two things:
1. Docker didn't pull the image again.
2. We have two containers created from the same image. Check it!

## docker rm commands

Containers remain until we delete them with `docker rm` command. This command removes one or more containers. You must pass the container name or the container ID.

USAGE: `docker rm [OPTIONS] CONTAINER [CONTAINER...]`

Try to run `docker rm hello hello2`{{execute}}

We can also delete images with the command:
`docker image rm hello-world`{{execute}} 
