# Step 1 - Keep on developing the inference app of the last course part

In the last course part we defined a simple FastAPI web application that exposes just 
a health-check endpoint. Now it's time to add more logic to our Dockerized app. 

In the `/root/project/step1/app/api.py` script now we expose a '/predict' endpoint that triggers 
a prediction operation using the model contained in `/root/project/step1/model/` path and then 
writes the results on the `/results/last_results.json` file placed inside the container 
file system.

> Execute `cd /root/project/step1/`{{execute}} to explore the project folder.

Using the Dockerfile located at `/root/project/step1/Dockerfile`  (that it's the resulting one 
from first part of this course) we can build this simple web app as a Docker image.

But first, let's add another COPY operation in the Dockerfile to bring also the model folder 
inside the container file system.

`COPY model /model`

> Now execute `docker build -t simple_api_img /root/project/step1`{{execute}}

As you can see from the console output, the Dockerfile is executed in 7 steps according
to the number of the instructions declared inside it. That's because Docker images 
(and also containers) are made of layers, but we'll talk about it later.

For now let's bring the application to life by creating and starting a container with 
the docker run command.

> Execute `docker run --name simple_api -p 80:80 simple_api_img`{{execute}}.

We're now seeing the stdout of the running container that says that we have Uvicorn
running on http://0.0.0.0:80. 

> Open a new terminal window and execute `curl http://0.0.0.0:80/health`.

Go back to the first terminal window to see the information logged.

---
### Docker logs

Stop this container (press ctrl+c) and then restart it using `docker start simple_api`
Now we're not seeing the application logs because the start command runs detached by default.
This means that the application is running but its stdout is not attached to our console.

In this case we can execute `docker logs -f simple_api` to see it. The -f option stands for
"follow" that means we will see the future logs emitted by the container in addition to the
already produced. Without this option we could only see the past logs.
---

Now let's call the '/predict' endpoint in order to request a simulation run.

> Go back to the second terminal window and execute 
> `curl -X POST http://0.0.0.0:80/predict`

The response says that the results are stored in a file inside the container file system.
We're simulating a scenario where the required operation could last long, and so the results 
cannot be returned in the HTTP response.

So let's explore the container file system:

> Execute `docker exec -it simple_api /bin/bash` to open a console on the container.  

With `ls /results`{{execute}} we should see a file named "last_results.json"

> Execute `more last_results.json` to see its content.

In this demo app if we call again the '/predict' endpoint this file will be overwritten.

In case we want to see the results of the predict operation without entering the 
container we can copy the interested file out of it, using the 'docker copy' command.

First exit the container, then:

> Execute `docker cp simple_api://results /root/first_result/`{{execute}} 

In addition to this, let's say that for development purposes we want to change the model 
used by our application with a new one without rebuilding the container.
We can execute the copy in the reverse way to bring inside the new model located on 
the host machine at /root/project/step1/svm.joblib

> Execute `docker cp /root/project/step1/svm.joblib simple_api://model`{{execute}} 

Now the application will use the new model to execute the prediction. So let's call
again the '/predict' endpoint.

> Go back to the second terminal window and execute `curl -X POST http://0.0.0.0:80/predict`

> Now execute `docker cp simple_api://results /root/secon_result/`{{execute}} to see the
> new results.

As you're seeing extracting data from the container file system or, backwards, putting them
inside it, is a tedious process. Since these actions could be useful while developing a 
Dockerized application we would prefer an easier way to do it. The answer is volumes.

**Most importantly** the container file system is ephemeral: it exists only until the container 
do the same. When you remove a container, also the file system is removed.
To persist data beyond containers' life volumes must be used.

So let's explore volumes in the next step.

---