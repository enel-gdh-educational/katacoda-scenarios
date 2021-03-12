# Docker volumes and their usage

In this section we'll explore Docker volumes and how we can use them to our advantage.

### Main reasons to volumes

* **Containers file systems are ephemeral**: by default, all files created inside a container 
  are stored on a writable container layer. This means that the data doesn’t persist when that 
  container no longer exists.
  

* **Sharing data between containers**: multiple containers can mount the same volume 
  simultaneously or in different times, either read-write or read-only.

  
* **Developing on host**: as we have seen in the previous section, while developing 
  and debugging an application it could be useful to bring files and folders inside a
  running container and vice versa. This could be made by mounting host partitions as 
  volumes into the container (called *bind mounts*).
  
*For more examples of use cases visit 
https://docs.docker.com/storage/#good-use-cases-for-volumes*

---

### What's a Docker volume?

A Docker volume is basically a directory external to the containers file systems that can 
be mounted on them. Volumes can be created independently of containers or while creating
one of them but, in both cases, a volume will have an independent life-cycle.

In the first case, this can be done by executing a docker command. Let's try it and create
our first Docker volume!

> Execute `docker volume create first_vol`{{execute}} and then 
> `docker volume ls`{{execute}}

We should see the new created volume with the chosen name. 
If we didn't specify the name then a random hash will be used instead by the Docker 
host (in this case we would be creating an *anonymous volume*).

In order to know where this volume will actually store files we can execute:
> `docker inspect first_vol`{{execute}}

Among the printed info there's the *mountpoint* that, as you can see, points to a part of 
the host filesystem which is managed by Docker (/var/lib/docker/volumes/ on Linux). 
Non-Docker processes should not modify this part of the filesystem.

The second way to create a volume is while bringing up a container. This could be done by 
declaring a volume mount in the "docker run" command. 

Let's try to create and run a new container from the *simple_api_img* Docker image that we 
previously built, but this time adding the *-v volume_name:/path/in/container* option that 
creates the volume with the requested name and mounts it on the requested path of the container.
Again, if we didn't specify the volume name then a random hash will be used instead by the 
Docker host. Specifying the name, instead, we can also use an already existent volume.

> Execute `docker run --name simple_api_with_volume -p 81:80 -v second_vol:/results -d simple_api_img`{{execute}}.

This time we used the -d option in order to run the new container in detached mode 
because we're not interested in seeing its logs.

As you may have noticed, we mounted the volume in the path where the application will store 
prediction results. In this way we can maintain the results beyond the containers lives and
also share them between multiple containers.

> Execute `docker ps`{{execute}} to check what's currently running on Docker host. There should
> be the container from the previous step and the new one.

> And now running `docker volume ls`{{execute}} we can see that a volume named "second_vol"
> has been created.

You can also check the result of the -v option by issuing `docker inspect simple_api_with_volume` 
and looking for "Mounts" field or to simplify: 
`docker inspect -f '{{ json .Mounts }}' simple_api_with_volume | jq`{{execute}}

As you see, the *simple_api_with_volume* container has mounted the *second_vol* volume
in the /results path as requested.

Ok, now go inside the container to check the results folder
> Execute `docker exec -it simple_api_with_volume /bin/bash`{{execute}} to open a 
> console on the container. And then `ls /results`{{execute}} to check that it's empty.

So, call the /predict endpoint in order to create a result file.

> Open a new terminal window and execute 
> `curl -X POST http://0.0.0.0:81/predict`{{execute}}
> and be sure to **use port 81** where our host mapped the new container.

---

When executing the *docker run* command, in case a Docker volume with the declared name 
already exists, that will be used. So, create and run a new container from the same image 
using again the "second_vol" volume:

`docker run --name simple_api_with_volume_1 -p 82:80 -v second_vol:/results -d simple_api_img`{{execute}}

Running `docker volume ls`{{execute}} we can see the same output as before.

Running `docker ps`{{execute}} we can see three containers now.

And then running 
`docker inspect -f '{{ json .Mounts }}' simple_api_with_volume_1 | jq`{{execute}}
we have the certainty that this new container is mounting the same volume.

Go inside this last container to check the results folder
> Execute `docker exec -it simple_api_with_volume_1 /bin/bash`{{execute}} to open a 
> console on the container. And then `ls /results`{{execute}} to check that this time 
> a result file inside already exists.

This is just an example made to give you the potential of using volumes to share contents 
between containers. Of course, there will be more useful scenarios than this.

As the final step, let's see how to delete a Docker volume.

> Execute `docker volume rm second_vol`{{execute}}

If we're seeing an error, that's okay because the volume is still used by some containers 
and cannot be deleted! This is valid also for stopped containers.

> So, stop and remove the containers with
`docker stop simple_api_with_volume simple_api_with_volume_1`{{execute}}
`docker rm simple_api_with_volume simple_api_with_volume_1`{{execute}}

Executing now `docker volume ls`{{execute}} we have the confirmation that also after the
death of the two containers that was using the volume, it remains up. In a way more realistic 
scenario, for example when the application at the startup downloads the model used to 
make the predictions from S3, we can store it on a Docker volume. Then we can define a logic ù
in the application that checks if the model is already existent in the volume to prevent 
unnecessary traffic when starting new containers.

> Now retry to remove the volume. This time it should work.


Another way to delete volumes is using `docker volume prune` that remove **all** the local
volumes not used by at least one container.

In conclusion, we explored why Docker volumes are useful, we learnt two different ways of 
creating Docker volumes and explored their lifecycles. Now continue to the next step where we'll
experiment to mount a host partition as a volume in to a container, the so called *bind mounts*.