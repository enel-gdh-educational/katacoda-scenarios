Now we start to build a real app and Dockerize it. For this step use code in /root/project/step4 directory

# Idea

Let's assume that we want to build a simple microservice that expose two endpoints:
- /health : to check the health of the service
- /predict : to make predictions using an AI model

For developing our app we will use FastAPI, a framework to build web applications in Python. Look at the `app/api.py` file. In this script we define the FastAPI app and define the `/health` endpoint. This base app will be expanded in the next steps.

## Try it locally

Let's try this app locally.
Navigate in the step4 directory `cd /root/project/step4`{{execute}},

install dependencies with `pip install -r requirements.txt`{{execute}}

and run `uvicorn app.api:app --host 0.0.0.0 --port 80`{{execute}}

We started our app locally. Now, open a new Terminal windows and test it. Try to run `curl http://localhost/health`{{execute}}

Does it work? Ok... Now imagine that you have to ship it to someone else. What should you do? At least, you must pass him the code, you must be sure he has Python installed and has the right version of Python, he has to install dependencies. There can be conflicts between different versions of libraries or different versions of Python. 

Fortunately, this is the perfect situation to use Docker! If we package our application in a Docker image, all we need to ensure is that the other person has Docker installed. Simple, right?

Let's package our application in a Docker image with all his dependencies and code.

## Dockerize it!

Inside the `step4` directory, create a Dockerfile. `touch Dockerfile`{{execute}}

As usual, start with the "FROM" instruction. In this exercise we could use alphine and install all requirements we need (python, Flask and other dependencies). Fortunately, there is an image called `python`, publicly available [here](https://hub.docker.com/_/python) on DockerHub, that is a image ready to execute Python code. So, insert `FROM python:3` in the Dockerfile. 

With the ":3" we are specifing the version 3 of Python. But it's not a magic process! Someone built Docker images with python3, python2, python2.7 and so on... So we can go to the [Python Docker image page](https://hub.docker.com/_/python) and choose the right version for our use-case between the versions available.

**NOTE:** It's not recommended to use `alphine` image for data science, since it's difficult to install `pandas` library.

### COPY Command

Now we need to provision the environment with the dependencies. So we will copy the `requirements.txt` file in the container and use it to install dependencies. To copy files in a container we can use the `COPY` instruction.

Usage: `COPY [--chown=<user>:<group>] <src>... <dest>`. 

The COPY instruction copies new files or directories from `<src>` and adds them to the filesystem of the container at the path `<dest>`.The `--chown` feature is only supported on Dockerfiles used to build Linux containers, and will not work on Windows containers. Since user and group ownership concepts do not translate between Linux and Windows, the use of /etc/passwd and /etc/group for translating user and group names to IDs restricts this feature to only be aviable for Linux OS-based containers.

### RUN Command

To execute commands we can't use `CMD` or `ENTRYPOINT`, but there is a specific instruction for this. It's `RUN`. 

Usage: `RUN <command>`.

The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile. Commands specified in this format run in a shell, which by default is `/bin/sh -c` on Linux or `cmd /S /C` on Windows.

The commands specified with the RUN instruction are executed during the image building. The command in the ENTRYPOINT instruction, instead, is executed directly from the container.

So, add these lines to the Dockefile:
```Dockerfile
COPY requirements.txt /requirements.txt
RUN python3 -m pip install --upgrade pip && pip3 install -r /requirements.txt
```

When we will build this image, Docker will put the requirements file in / path, will update pip and will install all dependencies.

Now, we can copy also the code of our app. We can do this in this way: 
```Dockerfile
COPY app /app
```

The last missing thing is the ENTRYPOINT instruction. So, insert 
```Dockerfile
ENTRYPOINT ["uvicorn", "app.api:app", "--host", "0.0.0.0", "--port", "80"]
```

---

**EXERCISE 4:** Build the image and run the container.

---

Let's try to call the health endpoint. Why doesn't it work? Because our app needs a port to communicate with the host. In particular, it needs the port 80.

## Port binding - EXPOSE command

![Docker ports](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part1/images/docker_ports.png)

We need tell Docker that our app need to **expose** the port 80, and we need also to tell Docker to link a port on our machine to the container port.
The first thing is possible with the `EXPOSE` instruction. 

Usage: `EXPOSE <port> [<port>/<protocol>...]`.

The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime. You can specify whether the port listens on TCP or UDP, and the default is TCP if the protocol is not specified.

In the Dockerfile, before the ENTRYPOINT, add `EXPOSE 80`. The EXPOSE instruction does not actually publish the port. It functions as a type of documentation between the person who builds the image and the person who runs the container, about which ports are intended to be published. To actually publish the port when running the container, use the -p flag on docker run to publish and map one or more ports, or the -P flag to publish all exposed ports and map them to high-order ports.

So, the second thing isn't specified in the Dockerfile, but it's possible with the "-p host-port:container-port" option of Docker.
This is necessary because we want to communicate with the container, but Docker containers can communicate to each others also without binding their port to the host machine. In this case, the first step (EXPOSE) is always necessary.

The right command is: `docker run --name app -p 80:80 docker-course-app`{{execute}}

As we said, we can also run other replicas of our applications simply running more containers of the same image. Let's try:

`docker run --name app-replica2 -p 80:80 docker-course-app`{{execute}}

Why doesn't work? Because we run two distinct containers that listen on the same port, but we mapped them to the same host port! So, it's not a problem having two or more container that listen on the same port, because these are container's ports. 

But, when we map these ports to the host, we must be sure to map them to different ports. 

---

**EXERCISE 5:** Run more replicas of the application and check that you can reach all of them.

---

