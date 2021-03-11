# Docker in Enel

In this third part of the course you have studied and analyzed all basic concepts about Docker:
- Registry to pull or push image in your own repository
- Docker network to connect different running containers
- Docker compose to set up infrastructure of containers docker with a single command line

In Enel World and in particular Global Data Hub, Docker is the technology that leverages the
development, testing and deployment of microservice.

You could use Docker in the following scenarios:
- Set up local environment
- Enel Artifactory
- CI/CD pipeline

### Local environment
You can use docker to start and test in your local pc microservices that will be deployed in 
kubernetes environment.

You have the following pros:
- Setting up environment in easier and faster way: after a `git pull` to update
  software version you can just execute `docker build` and `docker run` command
  in order to have a running and working environment
- You don't have to download dependencies in your local environment: a docker image described
by a dockerfile have all dependecies you need to start your container. There aren't troubles about
  conflict dependencies

### Enel Artifactory
Enel Artifactory is the repository where you publish and store artifacts written in different
languages (e.g. python). Of course you could use Enel Artifactory to share also Docker images

Using Enel Artifactory has the following advantages:
- the reuse of images: some images could be reused across different projects and contexts; you can
start from a common image version to build new images specific for a certain project
- Secure your docker image and limit access only to Enel project

### CI/CD pipeline

Docker is used in the configuration of CI/CD pipelines for models deployed as a microservices
in kubernetes.
At the end of the building step a new image version is pushed to an AWS registry (ECR)
so that it can be deployed in a pod in the kubernetes cluster of your application


# Install Docker
You can download and install Docker in you local machine according to the specific OS.
For the detailed installation procedure please refer to these following links
- Windows: https://docs.docker.com/docker-for-windows/install/
- Mac: https://docs.docker.com/docker-for-mac/install/