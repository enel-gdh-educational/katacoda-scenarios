#Docker Registry
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


### Docker tag
To push your image to a docker registry you must first name your local image.
A tag is an image name that gives you specific information about the different versions of the
same image.

`hostname/image_name:tag_name`

The name is made up slash-separated name components:
- `hostname` To push an image to a private registry and not the Docker Hub registry you 
  must tag it with the registry hostname and port (if needed).
- `image_name` Custom image name
- `tag name` It contains the version of the image; if it’s not specified, the tag defaults to latest.


You can tag local image by different ways:
- During building, using docker `build -t <hub-user>/<repo-name>[:<tag>]`
- By re-tagging an existing local image `docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]`
- By using `docker commit <existing-container> <hub-user>/<repo-name>[:<tag>]` to commit changes

You can use the following command to tag the existing image hello-world to push it to a 
third party repository. In this case you use Enel `artifactory.springlab.enel.com`

`docker tag hello-world artifactory.springlab.enel.com/enel-docker-course-img/hello-world:v0.1`{{execute}}

### Docker push
Command Docker push allow you to save and share a local image to a Docker registry.
Since we use a private Docker registry we use command docker login to access to the registry


`docker login artifactory.springlab.enel.com`{{execute}}

Then you can push the image on Artifactory

`docker image push artifactory.springlab.enel.com/enel-docker-course-img/hello-world:v0.1`{{execute}}


### Docker pull
You can use docker pull to save locally an image from a Docker registry.
By default, docker pull pulls images from Docker Hub. 
It is also possible to manually specify the path of a registry to pull from. 

For test purpose, fisrt you delete local image just created
`docker rmi artifactory.springlab.enel.com/enel-docker-course-img/hello-world:v0.1`

Then you pull the same image from Enel Artifactory

`docker pull artifactory.springlab.enel.com/enel-docker-course-img/hello-world:v0.1`{{execute}}







