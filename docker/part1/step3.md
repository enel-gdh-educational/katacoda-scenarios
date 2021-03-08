## Create our own image

Now it's time to create our own images and containers. To create a custom image we need to define a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. 

All comands have this format: `INSTRUCTION arguments`. The instruction is not case-sensitive. However, convention is for them to be UPPERCASE to distinguish them from arguments more easily. Docker runs instructions in a Dockerfile in order.

Let's start with the simple Dockerfile that you can find in `/root/project/step3/`Dockerfile. During the costruction of our image we'll discover some useful Dockerfile commands.

## FROM Command

The first line we find is `FROM alpine:latest`. FROM is an instruction that specifies the base image. 

Usage: `FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]` 

The FROM instruction initializes a new build stage and sets the Base Image for subsequent instructions. As such, a valid Dockerfile must start with a FROM instruction.  The optional --platform flag can be used to specify the platform of the image in case FROM references a multi-platform image. For example, linux/amd64, linux/arm64, or windows/amd64.

Docker starts from this to build our own image putting some other layers on it. Usually the application and his dependencies are added to a base image. Base images can be retrieved from DockerHub, from another registries (public or private) or built from another file and used as base. The ":latest" represents the version of the image. 

**NOTE:** In this exercise we use the alphine image. The alphine is a minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size! It's used when lightness is needed and we use it also because we don't have big requirements for a Hello world exercise.

If you need a complex environment for your application you should not use alphine image. In these cases you have two possibilities:
- Choose a specific image that provide you all tools and stacks you need. (Great advantage of Docker!)
- Choose a complete base image (e.g. Ubuntu, Debian) that offer you a solid base where you can install your stack, tools, libraries and dependencies without too many problems. 

## ENRTYPOINT Command

Next line is `ENTRYPOINT [ "echo", "Hello, World!" ]` 

The ENTRYPOINT instruction specifies the executable program that will be executed in the container. His syntax is `ENTRYPOINT [ "command", "param1", "param2", ...]`. Usually a Dockerfile starts with FROM instruction and end with an ENTRYPOINT.

## Build the image - docker build command
Once we wrote our Dockerfile, we can build our image. To do this, use the `docker build` command. 

Usage: `docker build [OPTIONS] PATH | URL `

The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified `PATH` or `URL`. The build process can refer to any of the files in the context. For example, your build can use a [_COPY_](https://docs.docker.com/engine/reference/builder/#copy) instruction to reference a file in the context.
 
The `URL` parameter can refer to three kinds of resources: Git repositories, pre-packaged tarball contexts and plain text files.

Run:
`cd /root/project/step3 && docker build -t my-hello:latest .`{{execute}}

The `-t` allows us to tag the image with a name and a version (tag). In this case we called our image "my-hello" and tagged as "latest" version. If you don't specify a tag, the "latest" is the default. After this option, we must specify the context. In this case we moved in the same directory of the Dockerfile, so we use "." context.

Now check that the new image is available with `docker images`{{execute}}

We can now start a container based on our image as we did for the first hello world container.

---

**EXERCISE 1:** Start a container based on the new image.

---

## CMD Command
Now we introduce another important instruction, the `CMD` instruction. 

Usage: `CMD ["executable","param1","param2"]`

There can only be one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect. The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable, or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.

So... What is the difference between specify parameters in ENTRYPOINT and in CMD?
Answer: The parameters in ENTRYPOINT instruction are immutable, once you build the image you can't change them without rebuilding it or without substitute the entire ENTRYPOINT instruction with a specific option of `docker run` command. The arguments in the CMD instruction, instead, can be overwritten when the container is run. If you specify also the command in the CMD instruction in the Dockerfile, also the commmand can be overwritten.

Let's edit our Dockerfile in this way:
```Dockerfile
FROM alpine:latest
ENTRYPOINT [ "echo" ]
CMD ["Hello, World!"]
```
---

**EXERCISE 2:** Rebuild the image, run a container and check that it has the same behaviour of the previous version.

---

For overwrite arguments simply pass them at the end of the `docker run` command.

Try this: `docker run --name custom-hello my-hello Hello from the Docker course!`{{execute}}

---

**EXERCISE 3:** Clean all stopped containers.

---