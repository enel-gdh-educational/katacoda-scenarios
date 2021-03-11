# Docker volumes and their usage

In this section we'll explore different kinds of Docker volumes and how we can use them
to our advantage.

### What's a Docker volume?

A Docker volume is basically a directory external to the containers file systems that can 
be mounted on them. Volumes can be created independently of containers or while creating
one of them.

In the first case this can be done by executing a docker command. Let's try it and create
our first Docker volume!

> Execute `docker volume create my_vol`{{execute}} and then 
> `docker volume ls`{{execute}}

We should see the new created volume with the chosen name. If we didn't specify the name then
a random hash will be used instead by the Docker host.

In order to know where this volume will actually store files we can execute:
> `docker inspect my_vol`{{execute}}

Among the printed info there's the *mountpoint* that, as you can see, points to a part of 
the host filesystem which is managed by Docker (/var/lib/docker/volumes/ on Linux). 
Non-Docker processes should not modify this part of the filesystem.

The second way to create a volume is while bringing up a container. This could be done by 
declaring a volume mount in the "docker run" command or by adding a VOLUME instruction in 
the Dockerfile. In the latter we're telling Docker to create a mount point with the specified 
path inside each container derived from the image.

With this new knowledge, let's make some changes to the Dockerfile in order




---

### Main reasons to volumes

* **Containers file systems are ephemeral**: by default, all files created inside a container are 
  stored on a writable container layer. This means that the data doesn’t persist when that 
  container no longer exists.
  

* **Sharing data between containers**: multiple containers can mount the same volume 
  simultaneously or in different times, either read-write or read-only.

  
* **Developing on host**: as we have seen in the previous section, while developing 
  and debugging an application it could be useful to bring files and folders inside a
  running container and vice versa. This could be made by mounting host partitions as 
  volumes into the container.
  
*For more examples of use cases visit 
https://docs.docker.com/storage/#good-use-cases-for-volumes*

---

### Types of volumes

We learnt how to create a Docker volume 

* **Anonymous volumes**: 
* **Named volumes**: 
* **Host volumes**: also called bind mounts 