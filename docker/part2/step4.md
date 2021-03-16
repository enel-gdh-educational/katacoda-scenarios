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
modifying existing files, and deleting files, are written to this thin writable container layer.

![Layers2](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part2/images/step4/layers_2.png)

So, each container that is based on the same image differs only for its last layer. This implies that it
can be shared between them, but also other different images and containers could have some layers in
common! Having decoupled a container image in a sequence of layers, Docker can avoid executing some 
steps of some Dockerfiles making use, instead, of their cached versions.

You can see this intermediate layers as a sort of hashed checkpoints that are memorized by the 
Docker host.

![Sharing layers](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part2/images/step4/sharing_layers.jpg)

**Important**: to be precise only RUN, COPY and ADD instructions actually create layers. All other 
instructions create temporary intermediate images that do not increase the size of the build.


If you think that when we update our application code and rebuild the image we are, in fact, 
creating a different Docker image, this mechanism saves to Docker host a lot of unnecessary work 
(and time to us) because we could reuse all the **previous** cached intermediate steps of the first 
image.

Layers and cache are two of the most powerful aspect of Docker that can speed up our daily work and 
are crucial when deploying our solutions on a production infrastructure. 
But we haven't experiment it yet, so let's get our hands dirty.


### Visualizing layers

In order to visualize the composition of a built image, docker provides a specific command:

> Execute `docker history simple_api_img`  
> Using *--no-trunc* option we could print the full Docker instructions (but it's quite difficult to read 
> on a console).

Each line represents an intermediate image (layer) with its hash identifier, creation time, the command 
contained in the Dockerfile that generated that layer and, finally, the size of the layer. Those are
ordered top-down from the most recent instruction to the oldest one.

As you can see there are more lines that you could have expected. The first five comes from our custom
Dockerfile, then there's a line with *CMD ["python3"]* that we didn't write, and under that until the 
bottom a lot with a "missing" image ID.

The &lt;missing&gt; lines in the docker history output indicate that those layers were built on 
another system. In fact those refer to the commands contained in the Dockerfile of our chosen base image
and are not available locally (are not cached). 

So, the *CMD ["python3"]* refers to the last layer of the base image that we used and that is saved on 
our Docker host cache. To get the total size of the base image

By issuing this command you can also verify if the base image has EXPOSE or ENV instructions which will 
of course affect also your custom image. This could be useful while developing if you don't have the 
Dockerfile of the base image.

---

### Order matters
    faccio vedere che succede cambiando l'ordine
    abbiamo visto che l'istruzione piu lunga temporalmente è quella dell'install dei req perche scarica
    e installa. Quindi spiego come funziona docker layer e faccio vedere la differenza tra mettere un 
    copy prima o dopo questo install. cambiando cio che deve essere copiato riesegue la run e non usa la cache
    spiego cache...

---

- alla fine link alle best practice per mantenere piccole le img (https://docs.docker.com/develop/dev-best-practices/#how-to-keep-your-images-small)
- spiega opzione build --no-cache
- spiega forse <none> images quando fai docker image ls -a
- spiega docker image prune e quando usarlo