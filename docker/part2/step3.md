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

### Tmpfs mounts

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

![Type of Mounts](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part2/images/step3/types_of_mounts.png)


### Exercise with bind mounts

Ok, after this little theoretical introduction, let's get practical on bind mounts.

Do you remember the first step of this course part when we added the COPY instruction on the 
Dockerfile in order to bring a folder with the model file inside the container?

<details>
    <summary>No?</summary>

![Understandable](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part2/images/step3/understandable.jpg)


Ah ah. Ok enough. Check the Dockerfile at */root/project/step1*
</details>

Ok let's achieve the same result but this time using a bind mount. 
First, remove the second COPY instruction from the Dockerfile in */root/project/step1* and rebuild 
the image with:

>`docker build -t simple_api_img /root/project/step1`{{execute}}

This will be super fast compared to the first time because Docker is smart and caches your layers.
This is a key argument and will be explained in more detail further in the course.

Now create and start a new container that binds */root/project/step1/model/* host directory with 
*/models* inside the container file system.

> Execute `docker run --name simple_api_bind -p 90:80 -v /root/project/step1/model/:/models -d simple_api_img`{{execute}}.

Remember that this volume is not managed by Docker so executing `docker volume ls`{{execute}}
will not show bind mounts. Any other docker volume command that we saw in the earlier step 
will not work with this volume.

> But, running `docker inspect -f '{{ json .Mounts }}' simple_api_bind | jq`{{execute}}
> we can check that the binding worked correctly.

#### Exercise

Let's do the same test as before: 

1. Monitor (following) the logs of the container mapped on port 90 of your host

2. Call the api on the */predict* endpoint to run a simulation and check in the logs which
model is being used.
   
3. Working only on your host file system copy a new model (.joblib file) in the host volume

4. Re-execute step 2 and you should see that the app is using the last copied model (because the
   application code is written to do that). You can also see that is returning different results
   
5. <span style="color:orange">
    [Optional]
   </span> 
   Check the container file system to see that matches the source folder on your host.
   

As intended, the content of the source folder used in a bind mount will persist beyond container 
life. Stop and remove *simple_api_bind* container, and the folder will still be there on your 
file system.

Imagine a bind mount used for example, while executing a training operation instead of a 
predict-one and this simple exercise acquires more sense.

---

Great! You should now have a good comprehension of storage options while working on Docker.
Continue to the next step where we'll be facing how Docker layering really works and how we can
use that in our favor while developing with Docker.