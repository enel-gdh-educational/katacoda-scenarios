Now we start to build a real app and Dockerize it. For this step use code in /root/project/step3 directory

Let's assume that we want to build a simple microservice that expose two endpoints:
- /health : to check the health of the service
- /predict : to make predictions using an AI model

For developing our app we will use Flask, a framework to build web application in Python. Look at the `app/main.py` file. In this script we define the Flask app, define the `/health` endpoint and run the app. This base app will be expanded in the next steps.

Let's try this app locally.
Navigate in the step3 directory `cd /root/projct/step3`{{execute}},

install dependencies with `pip install -r requirements.txt`{{execute}}

and run `python3 app/main.py`{{execute}}

We started our app locally. Now, open a new Terminal windows and test it. Try to run `curl http://localhost:5000/health`{{execute}}

Does it work? Ok, but... how we deploy it? This is the perfect situation to use Docker. Let's package our applciation in a Docker image with all his dependencies and code.

Inside the `step3` directory, create a Dockerfile. `touch Dockerfile`{{execute}}

As usual, start with the "FROM" instruction. We will use the `python` image, publically available on DockerHub [(link)](https://hub.docker.com/_/python). So, insert `FROM python:3` in the Dockerfile.

Now we need to provision the environment with the dependencies. So we will copy the `requirements.txt` file in the container and use ti to install dependencies. To copy files in a container we can use the `COPY` instruction in this way `COPY src/path dest/path`. To execute commands we can't use `CMD` or `ENTRYPOINT`, but there is a specific instruction for this. It's `RUN`. The commands specified with the RUN instruction are executed during the image building. The command in the ENTRYPOINT instruction, instead, is executed directly from the container.

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

We need tell Docker that our app need to **expose** the port 5000 and we need also to tell Docker to link a port onn our machine to the container port.
The first thing is possible with the `EXPOSE` instruction. In the Dockerfile, before the ENTRYPOINT, add `EXPOSE 5000`. This lets the container open the port 5000, so our app can receive requests. 
The second thing isn't specified in the Dockerfile but it's possible with the "-p host-port:container-port" option of Docker.
This is necessary because we want to communicate with the container, but Docker containers can communicate to each others also without binding their port to the host machine. In this case, the first step (EXPOSE) is always necessary.

TODO: finish this step: docker stop, restart the container, exec some commands inside the container.
