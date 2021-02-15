Now we start to build a real app and Dockerize it. For this step use code in /root/project/step3 directory

Let's assume that we want to build a simple microservice that expose two endpoints:
- /health : to check the health of the service
- /predict : to make predictions using an AI model

For developing our app we will use Flask, a framework to build web applications in Python. Look at the `app/main.py` file. In this script we define the Flask app, define the `/health` endpoint and run the app. This base app will be expanded in the next steps.

Let's try this app locally.
Navigate in the step3 directory `cd /root/project/step3`{{execute}},

install dependencies with `pip install -r requirements.txt`{{execute}}

and run `python3 app/main.py`{{execute}}

We started our app locally. Now, open a new Terminal windows and test it. Try to run `curl http://localhost:5000/health`{{execute}}

Does it work? Ok... Now imagine that you have to ship it to someone else. What should you do? At least, you must pass his the code, you must be sure he has Python installed and has the right version of Python, he has to install dependencies. There can be conflicts between different versions of libraries or different versions of Python. But, fortunately, this is the perfect situation to use Docker! If we package our application in a Docker image, all we need to ensure is that the other person has Docker installed. Simple, right?

Let's package our application in a Docker image with all his dependencies and code.

Inside the `step3` directory, create a Dockerfile. `touch Dockerfile`{{execute}}

As usual, start with the "FROM" instruction. In this exercise we could use alphine and install all requirements we need (python, Flask and other dependencies). Fortunately, there is an image called `python`, publicly available [here](https://hub.docker.com/_/python) on DockerHub, that is a image ready to execute Python code. So, insert `FROM python:3` in the Dockerfile. 

With the ":3" we are specifing the version 3 of Python. But it's not a magic process! Someone built Docker images with python3, python2, python2.7 and so on... So we can go to the [(Docker image page)](https://hub.docker.com/_/python) and choose the right version for our use-case between the versions available.

**NOTE:** It's not recommended to use `alphine` image for data science, since it's difficult to install `pandas` library.

Now we need to provision the environment with the dependencies. So we will copy the `requirements.txt` file in the container and use it to install dependencies. To copy files in a container we can use the `COPY` instruction.

Usage: `COPY [--chown=<user>:<group>] <src>... <dest>`. 

The COPY instruction copies new files or directories from `<src>` and adds them to the filesystem of the container at the path `<dest>`.The --chown feature is only supported on Dockerfiles used to build Linux containers, and will not work on Windows containers. Since user and group ownership concepts do not translate between Linux and Windows, the use of /etc/passwd and /etc/group for translating user and group names to IDs restricts this feature to only be viable for Linux OS-based containers.

To execute commands we can't use `CMD` or `ENTRYPOINT`, but there is a specific instruction for this. It's `RUN`. 

Usage: `RUN <command>`.

The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile. Commands specified in this format run in a shell, which by default is /bin/sh -c on Linux or cmd /S /C on Windows.

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
ENTRYPOINT [ "python3", "/app/main.py" ]
```

**EXERCISE:** Build the image and run the container.

Why doesn't it work? Because our app needs a port to communicate with the host. In particular, it needs the port 5000.
![Docker ports](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part1/images/docker_ports.png)

We need tell Docker that our app need to **expose** the port 5000, and we need also to tell Docker to link a port on our machine to the container port.
The first thing is possible with the `EXPOSE` instruction. 

Usage: `EXPOSE <port> [<port>/<protocol>...]`.

The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime. You can specify whether the port listens on TCP (default) or UDP, and the default is TCP if the protocol is not specified.

In the Dockerfile, before the ENTRYPOINT, add `EXPOSE 5000`. The EXPOSE instruction does not actually publish the port. It functions as a type of documentation between the person who builds the image and the person who runs the container, about which ports are intended to be published. To actually publish the port when running the container, use the -p flag on docker run to publish and map one or more ports, or the -P flag to publish all exposed ports and map them to high-order ports.

So, the second thing isn't specified in the Dockerfile, but it's possible with the "-p host-port:container-port" option of Docker.
This is necessary because we want to communicate with the container, but Docker containers can communicate to each others also without binding their port to the host machine. In this case, the first step (EXPOSE) is always necessary.

TODO: finish this step: docker stop, restart the container, exec some commands inside the container.

