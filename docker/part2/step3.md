# Bind Mounts

Docker volumes aren't the only mount type available while working with Docker containers.

In fact, there are also **bind mounts** sometime called *host volumes* that differs from the
Docker volumes because they are not managed by Docker and because they may be stored 
anywhere on the host system. They may even be important system files or directories. 
Non-Docker processes on the Docker host or a Docker container can modify them at any time. 

The file or directory is referenced by its full path on the host machine. The file or directory 
does not need to exist on the Docker host already. It is created on demand if it does not yet 
exist. Because they're not managed by Docker, you cannot use Docker CLI commands to directly 
manage bind mounts.

> Attention!   
> Bind mounts allow access to sensitive files.  
> One side effect of using bind mounts, for better or for worse, is that you can change the 
> host filesystem via processes running in a container, including creating, modifying, or 
> deleting important system files or directories. This is a powerful ability which can have 
> security implications, including impacting non-Docker processes on the host system.

---

###Tmpfs mounts

If you’re running Docker on Linux you can also use a **tmpfs mount**. As opposed to volumes and 
bind mounts, a tmpfs mount is temporary, and only persisted in the host memory. 
When the container stops, the tmpfs mount is removed, and files written there won’t be persisted.

This could be useful to temporarily store sensitive files that you don’t want to persist in 
either the host or the container writable layer.
---

No matter which type of mount you choose to use, the data looks the same from within the container.
It is exposed as either a directory or an individual file in the container’s filesystem.

An easy way to visualize the difference among volumes, bind mounts, and tmpfs mounts is to think 
about where the data lives on the Docker host.

![Type of Mounts](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part2/images/types-of-mounts.png)


###Exercise with bind mounts

Ok, after this little theoretical introduction, let's get practical on bind mounts.

Do you remember the first step of this course part when we added the COPY instruction on the 
Dockerfile in order to bring a folder with the model file inside the container?

<details>
    <summary>No?</summary>

![understandable](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part2/images/understandable.jpg)

</details>

Yes? Ok let's achieve the same result but this time using a bind mount. 
First, remove the COPY instruction from the Dockerfile in */root/project/step1* and rebuild 
the image with `docker build -t simple_api_img /root/project/step1`{{execute}}

Now create and start a new container that binds */root/project/step1/model/* folder with */models*
inside the container file system.