## List of commands to complete the excercise:

- Activate minikube environment

```
minikube start
```{{execute}}

- Locate into the /root/train folder and build the first image using Docker.

```
cd train
docker build -t sapienza/train .
```{{execute}}

- Modify the Dockerfile located in the predict folder and make it look like this:

```
FROM python:3.6

# Set the timezone to the correct one (CET).
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install relevant packages
RUN apt-get -yq update && apt-get -yqq install ssh

# Copy files and authorize SSH Host
COPY ./ssh_config .
RUN mkdir -p /root/.ssh && chmod 777 /root/.ssh
COPY ./id_deploy_key /root/.ssh/predict_rsa
RUN chmod 700 /root/.ssh/predict_rsa
RUN cat ./ssh_config >> /root/.ssh/config

# Clone repository into container
WORKDIR /usr/src/app
RUN git clone --branch master --single-branch --depth 1 git@github.com:aaleht/demo-sapienza-predict.git

# Locate into the repository and install requirements
WORKDIR /usr/src/app/demo-sapienza-predict
RUN pip install -r requirements.txt

EXPOSE 8083

CMD ["python", "main.py"]

```{{copy}}

- Locate into the /root/predict folder and build also the image for the prediction app.

```
cd
cd predict
docker build -t sapienza/predict .
```{{execute}}

- Edit the deployment.yml file to look like this:

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
        image: sapienza/train
        imagePullPolicy: Never
        ports:
        - containerPort: 80
        volumeMounts:
        - name: models
          mountPath: "/etc/models"
      - name: predict-app
        image: sapienza/predict
        imagePullPolicy: Never
        ports:
        - containerPort: 8083
        volumeMounts:
        - name: models
          mountPath: "/etc/models"
      volumes:
      - name: models
```{{copy}}

- Locate into the /root folder and deploy the application using Kubernetes and the deployment file yet edited.

```
cd
kubectl create -f deployment.yml
```{{execute}}

- Investigate and have a look to the pod just created.

```
kubectl describe pods
```{{execute}}

- Edit the script "api_call_test.py" and fill the function with the right ip address of your pod.

- Run the python function that calls the predict api

```
python3 api_call_test.py
```{{execute}}


## Other Useful Commands

- List available docker images:

```
docker images
```{{execute}}

- List available pods:

```
kubectl get pods
```{{execute}}

- Print logs of a container (see what's happening inside)

  *note that the following commands won't work! You have to provide the correct pod_id and container_id that exist in your environment. You should know how to list them ;)*

```
kubectl logs <pod_id> <container_id>
```{{execute}}

- Start a terminal (bash) inside a container and execute commands directly there (look at the code etc...)

```
kubectl exec -it <pod_id> --container <container_id> /bin/bash
```{{execute}}


Enjoy :)

