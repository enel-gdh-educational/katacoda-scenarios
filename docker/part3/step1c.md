#Docker Registry


### Docker push
Command Docker push allow you to save and share a local image to your own Docker registry.
For this purpose you can use Enel Artifactory.

In order to pull/push docker images to Enel Artifactory from your terminal you must use
**Enel VPN** and add `artifactorydocker.springlab.enel.com` as insecure registry inside your docker
configuration (see more details in https://docs.docker.com/registry/insecure)

If you have **Docker Desktop** application o your Windows/Mac you can copy and paste this snippet
in section 'Docker > Preferences > Docker Engine' After that apply and restart.

```
{
  "experimental": false,
  "features": {
    "buildkit": true
  },
  "insecure-registries": [
    "artifactorydevdocker.springlab.enel.com",
    "artifactorydocker.springlab.enel.com",
    "artifactorydev.springlab.enel.com"
  ]
}
```

If you have Linux you can paste the snippet in file `/etc/docker/daemon.json` as you can see
in https://docs.docker.com/registry/insecure

Since we use a private Docker registry we use command docker login to access to the registry
and put your username and artifactory api-key interactively

`docker login artifactorydocker.springlab.enel.com`{{execute}}

Then you can push the image on Artifactory

`docker image push artifactorydocker.springlab.enel.com/enel-docker-course-img/hello-world:v0.1`{{execute}}


### Docker pull
You can use docker pull to save locally an image from a Docker registry.
By default, docker pull pulls images from Docker Hub. 
It is also possible to manually specify the path of a registry to pull from. 

For test purpose, fisrt you delete local image just created
`docker rmi artifactory.springlab.enel.com/enel-docker-course-img/hello-world:v0.1`

Then you pull the same image from Enel Artifactory

`docker pull artifactorydocker.springlab.enel.com/enel-docker-course-img/hello-world:v0.1`{{execute}}

Check the result using this command

`docker images`

### Docker logout

You can use this command if you want logging out from artifactory

`docker logout artifactorydocker.springlab.enel.com`







