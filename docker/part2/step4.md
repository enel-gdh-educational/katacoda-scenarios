# Docker Layers

As promised before, in here we talk about what Docker images and containers are really made of: layers.

The file system of an image or a container consists of an overlap of layers unified by AUFS 
(*Advanced multi-layered Unification FileSystem*, originally was *Another Union FS*). This means that
a file is read on the highest layer where it's found inside a container and that the only layer that 
can be written at runtime is the highest.

![Layers1](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part2/images/step4/layers_1.png)

> **Union mounting** is a technic aimed at combining multiple directories into one that 
> appears to contain their combined contents.  
> For more info: https://en.wikipedia.org/wiki/Union_mount

When you use an image to generate a container, you add a new writable layer (the “container layer”) 
on top of the underlying layers. All changes made to the running container, such as writing new files, 
modifying existing files, and deleting files, are written to this thin writable container layer. Any 
files that the container doesn't change do not get copied to this writable layer. This means that the 
writable layer is as small as possible.

![Layers2](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part2/images/step4/layers_2.png)

So, each container that is based on the same image differs only for its last layer. This implies that 
all the underlying can be shared between them, but also other different images and containers could have 
some layers in common! Having decoupled a container image in a sequence of layers, Docker can avoid 
executing some steps of some Dockerfiles making use, instead, of their cached versions.

You can see this intermediate layers as a sort of hashed checkpoints that are memorized by the 
Docker host. Similar to a git commit that adds files or just some lines to the previous.

![Sharing layers](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part2/images/step4/sharing_layers.jpg)

**Important**: to be precise only RUN, COPY and ADD instructions actually create layers. All other 
instructions create temporary intermediate images that do not increase the size of the build.

If you think that when we update our application code and rebuild the image we are, in fact, 
creating a different Docker image, this mechanism saves to Docker host a lot of unnecessary work 
(and time to us) because we could reuse all the **previous** cached intermediate steps of the first 
image.

**Layers and cache** are two of the most powerful aspect of Docker that can speed up our daily work and 
are crucial when deploying our solutions on a production infrastructure. 
But we haven't experiment it yet, so let's get our hands dirty.


### Visualizing layers

In order to visualize the composition of a built image, docker provides a specific command:

> Execute `docker history simple_api_img`{{execute}}  
> Using *--no-trunc* option we could print the full Docker instructions (but it's quite difficult to read 
> on a console).

Each line represents an intermediate image (layer) with its hash identifier, creation time, the command 
contained in the Dockerfile that generated that layer and, finally, the size of the layer. Those are
ordered top-down from the most recent instruction to the oldest one.

As you can see there are more lines that you could have expected. The first five comes from our custom
Dockerfile, then there's a line with *"CMD ["python3"]"* that we haven't written, and under that until 
the last, a lot of lines with a "missing" image ID.

The &lt;missing&gt; lines in the docker history output indicate that those layers were built on 
another system. In fact those refer to the commands contained in the Dockerfile of our chosen base image
and are not available locally (are not cached).

So, the *"CMD ["python3"]"* line refers to the last layer of the base image that we used and that is 
saved, as a complete image, on our Docker host cache. To get the total size of the base image we could 
sum up all the underlying lines.

As stated before only RUN, COPY and ADD instruction creates layer and in here you can see that the 
others instructions, in fact, are 0 Byte heavy.

By issuing docker history command you can also verify if the base image has EXPOSE or ENV instructions 
which will of course affect also your custom image. 

> You can achieve the same result with:  
> `docker inspect -f '{{ json .ContainerConfig.Env }}' simple_api_img | jq`{{execute}}

This could be useful while developing if you don't have the Dockerfile of the base image.

---

### Order matters

Now that we know that Docker creates multiple layers while processing our Dockerfile and that it also
stores this layers in its own cache system, we can optimize Dockerfiles.

The first lesson to learn is that **order matters** because once a layer changes, all downstream layers 
have to be recreated as well. In other words when the docker host gets a cache-miss on an instruction
of your Dockerfile, it stops searching in your cache also for subsequent instructions.

Of course, we want to avoid that scenario when instructions are not effectively coupled together.
While developing, the application code is the part that more often will change and could be a good 
idea trying to move that to the bottom of the Dockerfile.

Enough with the theory, let's get back to being practical.

Reopen `/root/project/step1/Dockerfile`. The COPY instruction that brings the app code inside the
container is executed after the requirements install. This means that changing the code will not affect
the previous layer that could be retrieved from cache.

But first, a quick test. We should already had built this image at least one time so re-executing:
`docker build -t simple_api_img /root/project/step1`{{execute}} should mean reusing all cached layers
in no time. Docker Power!

Now modify the code in `/root/project/step1/app/api.py` adding, for example, another print in the 
*/health* endpoint. Without modifying the Dockerfile rebuild the image issuing the same command.

This time too it was quite fast. Of course the size of the copied folder matters, but is nothing compared
to downloading and installing again all the libraries declared in the requirements file!

Just for saying, if you have an heavy file to bring inside the container you could also split the COPY 
instruction in multiple COPY where the first one move the heavy load. In this way, also changing files 
interested in the last COPY, builds will continue to be fast.

Inspecting the console output we can see that the first step is not executed because it's not pulling
the image from library/python, steps 2 and 3 says *"Using cache"* and, after that, all the other 
doesn't because those are being executed again.

If, for some reason, using the cached versions of layers could be a problem in some particular scenario,
you can always make use of the **--no-cache** option while building your image and doing so Docker will 
always re-execute all the instructions.

---

#### Exercise

To make this point even stronger move the `COPY app /app` instruction right after the 
`COPY requirements.txt /requirements.txt`.

Re-execute the previous test: build the image, change a code line, and build again.

You can see that in the second build, despite the requirements.txt didn't change,
(and in fact that COPY it's a cache-hit) the RUN step is being re-executed.

---

As a side note, another suggestion is to always specify the version number of the library contained 
in your requirements files, not particularly because of Docker but, rather, to avoid installing new
versions without realizing it.

So, be sure to use the best order of instructions in your Dockerfiles next time to enjoy Docker
at its best :D

For a more-in-depth excursus on how to optimize Dockerfiles in order to be more efficient and also to 
keep the images small, I suggest you to read:
* *https://docs.docker.com/develop/dev-best-practices/#how-to-keep-your-images-small*
* *https://docs.docker.com/develop/develop-images/dockerfile_best-practices/*