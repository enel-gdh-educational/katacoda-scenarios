# Let's use containers!

Now that we learned some basics concepts, let's start experimenting with Docker and Containers!

Every journey in IT starts with a Hello world, so run:
`docker run --name hello hello-world`{{execute}} 

The output of the container tell us what happened.

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

### 1. Docker daemon
This is the persistent process that manages containers. We interact with it through the CLI.

### 2. Images and Docker Hub
The container's images are one of the most important elements. Someone can confuse Docker containers and Docker images, so let's explain.

An **image** is a model for the creation of one or more containers. It's a static element, and it isn't executed directly.

A **container** is a running entity, created from an image. So, from an image, we can create more containers.

So Docker, for create our "hello world" container used the "hello-world" image. But where Docker found it? Answer: in Docker Hub. It's a public registry that contains Docker images ready to be executed. Docker Hub it's the public registry of Docker, but there are also private registries. These public registries usually contains base images that can be used to package our applications. For example there are images for Ubuntu, PostgreSQL, MongoDB, Kafka, and Python.

### 3. Run the container
At this point Docker created and executed the container. This is because we told him to do it. We executed `docker run` command. 

"Docker run" is used to execute containers. It must specify an *IMAGE* to derive the container from. 

---

Now, we have executed our first container. To see all running containers run:
`docker ps`{{execute}} 

We have zero containers running, and it's exact because our container started, executed something and exited. To see all containers run:
`docker ps -a`{{execute}}
Here we can see out hello-world container with "Exited" status. 

We told before the difference between container and images. We can also list all the images available locally with the command `docker images`{{execute}}

We can see that we have the "hello-world" image pulled. But the relationship between images and container is not 1:1, so we can create another container name "hello2" with this command
`docker run --name hello2 hello-world`{{execute}} 
And see that we have two containers created from the same image. Check it!

Containers remain until we delete them with `docker rm hello hello2`{{execute}} command. This command remove one or more container. You must pass the container name or the container ID.
We can also delete images with the command:
`docker image rm hello-world`{{execute}} 