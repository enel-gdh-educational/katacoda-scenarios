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
Here we can see our hello-world container with "Exited" status. 

We told before the difference between container and images. We can also list all the images available locally with the command `docker images`{{execute}}

We can see that we have the "hello-world" image pulled. But the relationship between images and container is not 1:1, so we can create another container name "hello2" with this command
`docker run --name hello2 hello-world`{{execute}} 
And see that we have two containers created from the same image. Check it!

Containers remain until we delete them with `docker rm hello hello2`{{execute}} command. This command remove one or more container. You must pass the container name or the container ID.
We can also delete images with the command:
`docker image rm hello-world`{{execute}} 

## Create our own image

Now it's time to create our own images and containers. To create a custom image we need to define a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. 

Let's start with the simple Dockerfile that you can find in /root/project/step2/Dockerfile. 

`FROM alpine:latest` is an instruction that specifies the base image. Docker starts from this to build our own image putting some other layers on it. Usually the application and his dependencies are added to a base image. Base images can be retrieved from DockerHub, from another registries (public or private) or build from another file and used as base. The ":latest" represents the version of the image. 

`ENTRYPOINT [ "echo", "Hello, World!" ]` The ENTRYPOINT instruction specifies the executable program that will be executed in the container. His syntax is `ENTRYPOINT [ "command", "param1", "param2", ...]`. Usually a Dockerfile starts with FROM instruction and end with an ENTRYPOINT.

Once we wrote our Dockerfile, we can build our image. To do this, use the `docker build` command. Run:
`cd /root/project/step2 && docker build -t my-hello:latest .`{{execute}}

The `-t` allows us to tag the image with a name and a version (tag). In this case we called our image "my-hello" and tagged as "latest" version. If you don't specify a tag, the "latest" is the default. After this option, we must specify the context. In this case we moved in the same directory of the Dockerfile, so we use "." context.

Now check that the new image is available with `docker images`{{execute}}

We can now start a container based on our image as we did for the first hello world container.

**EXERCISE 1:** Start a container based on the new image.

---

Now we introduce another important instruction, the `CMD` instruction. It allows specifying arguments and parameters for the ENTRYPOINT instruction. 
So... What is the difference between specify parameters in ENTRYPOINT and in CMD?
Answer: The parameters in ENTRYPOINT instruction are immutable, once you build the image you can't change them without rebuilding it. The arguments in the CMD instruction, instead, can be overwritten when the container is runned.

Let's edit our Dockerfile in this way:
```Dockerfile
FROM alpine:latest
ENTRYPOINT [ "echo" ]
CMD ["Hello, World!"]
```

**EXERCISE 2:** Rebuild the image, run a container and check that it has the same behaviour of the previous version.

For overwrite arguments simply pass them at the end of the `docker run` command.

Try this: `docker run --name custom-hello my-hello Hello from the Docker course!`{{execute}}

**EXERCISE 3:** Clean all stopped containers.