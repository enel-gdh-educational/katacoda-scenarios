# Docker in Enel

In this third part of the course you have studied and analyzed all basic concept about Docker:
- Registry to pull or push image in your own repository
- Docker network to connect different running container
- Docker compose to set up infrastructure of containers docker

In Enel World and in particular Global Data Hub, Docker is the technology that leverages the
development, testing and deploy of microservice.

You use Docker in the following scenarios:
- Set up local environment
- Enel Artifactory
- CI/CD pipeline

### Local environment
You can use docker to tet in your local pc the microservice that will be deploy in 
kubernetes environment.

We have the following pros:
- set up environment in easier and faster way: after a git pull to update
  software version you can just execute docker build and docker run command
  in order to have a running and working environment
- You don't have to download dependencies in your local environment: a docker image described
by a dockerfile have all dependecies you need to start your container. There aren't troubles about
  conflict dependencies

### Enel Artifactory
Enel Artifactory is the repository where you publish and store library code written in different
language (e.g. python). Of course you can use Enel Artifactory to share also Docker image

Using Enel Artifactory allows you:
- the reuse of images: some images could be reused across different projects and context; you can
start from a common image version to build new images specific for a certain project
- Secure your docker image and limit access only to Enel project

### CI/CD pipeline

Docker is used in the configuration of CI/CD pipelines for models deployed as a microservices
in kuberneres
At the end of the building step a new image version is pushed to an AWS registry 
so that it can be deployed in a pod in the kubernetes cluster


# Install Docker
You can download and install Docker in you local machine according to the specific OS.
For the detailed installation procedure refer to these following link, where you can find 
- Windows: https://docs.docker.com/docker-for-windows/install/
- Mac: https://docs.docker.com/docker-for-mac/install/