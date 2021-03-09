#Docker Registry


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







