# Keep on developing the inference app of the last course part

In the last course part we defined a simple FastAPI web application that exposes just 
a health-check endpoint. Now it's time to add more logic to our Dockerized app. 

In the `/root/project/api.py` script now we expose a '/predict' endpoint that triggers 
a prediction operation using the model contained in `/root/project/model/` path and then 
writes the results on the `/app/results/last_results.json` file placed inside the container 
file system.

Execute `cd /root/project/`{{execute}} to explore the project folder.

Using the Dockerfile located at `/root/project/Dockerfile`  (that it's the same resulting 
from first part of this course) we can build this simple web app as a Docker image.

Execute `docker build -t simple_api_img /root/project/` {{execute}}

As you can see from the console output the Dockerfile it's executed in 4 step

