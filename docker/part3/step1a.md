#Docker Registry

### Introduction

A Docker registry is a server side application that allows you to share docker
images with your team and community.
It has many repositories and each repository has different versions of the same image which are
individually versioned with tags.


Pros Docker Registry:
- Team collaboration
- Quality and reuse
- Automate development: we can integrate images storage with pipelines and workflow development
- Secure docker images: you can use a private docker registry and limit the access to your 
  docker image


When you pull an image you implicitly use Docker Hub Registry.

`docker pull hello-world`{{execute}}

example output:
```
Using default tag: latest
latest: Pulling from library/hello-world
0e03bdcc26d7: Pull complete 
Digest: sha256:31b9c7d48790f0d8c50ab433d9c3b7e17666d6993084c002c2ff1ca09b96391d
Status: Downloaded newer image for hello-world:latest
docker.io/library/hello-world:latest
```

When you build an image you can choose to push it to a remote registry like Docker Hub,
which is both a public and private service for hosting Docker repositories, or you can use
a third party registry.

For this course you can use this docker registry created on Enel Artifactory 
https://artifactory.springlab.enel.com/artifactory/webapp/#/artifacts/browse/tree/General/enel-docker-course-img








