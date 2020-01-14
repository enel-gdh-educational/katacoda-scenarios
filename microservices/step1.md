## List of commands to complete the excercise:

- Activate minikube environment

```
minikube start
```{{execute}}

- Locate into the demo_train folder and build the first image using Docker.

```
ls
```{{execute}}

```
cd demo_train
ls
```{{execute}}

- Build train container 

```
docker build -t train_image .
```{{execute}}

- Modify the Dockerfile located in the demo_predict folder and make it look like this:

```
FROM python:3.6

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install cron -y --no-install-recommends

WORKDIR /usr/src/app
COPY ./ ./
RUN pip install -r requirements.txt
EXPOSE 8083
CMD ["python", "main.py"]
```{{copy}}

- Locate into the demo_predict folder and build also the image for the prediction app.

```
cd ..
cd demo_predict
docker build -t predict_image .
```{{execute}}

- Edit the deployment.yml file and make it look like this:

```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: ml-app
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: ml-app
    spec:
      containers:
      - name: train-app
        image: train_image
        imagePullPolicy: Never
        ports:
        - containerPort: 80
        volumeMounts:
        - name: models
          mountPath: "/etc/models"
      - name: predict-app
        image: predict_image
        imagePullPolicy: Never
        ports:
        - containerPort: 8083
        volumeMounts:
        - name: models
          mountPath: "/etc/models"
      volumes:
      - name: models
```{{copy}}

- Locate into the /root folder and deploy the application using Kubernetes and the deployment.yml file:

```
cd ..
kubectl create -f deployment.yml
```{{execute}}

- Investigate and have a look at the pod just created.

```
kubectl describe pods
```{{execute}}

- Locate in the demo_predict folder and edit the script "client.py" and fill the function with the right ip address of your pod.

```
cd demo_predict
```{{execute}}

- Run the python client that calls the predict API

```
python3 client.py
```{{execute}}


## Other Useful Commands

- List available docker images:

```
docker images ps -a
```{{execute}}

- List available pods:

```
kubectl get pods
```{{execute}}

- Print logs of a container (see what's happening inside)

  *note that the following commands won't work! You have to provide the correct pod_id and container_id that exist in your environment. You should know how to list them ;)*

````
kubectl logs <pod_id> -c <container_id>
```{{execute}}

- Start a terminal (bash) inside a container to execute commands directly in there

```
kubectl exec -it <pod_id> --container <container_id> /bin/bash
```{{execute}}


Enjoy :)

