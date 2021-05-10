We saw how to run and remove containers, but a container lifecycle can be more complex than this. 

![Container lifecycle](https://miro.medium.com/max/1129/1*vca4e-SjpzSL5H401p4LCg.png)

We always created containers with `docker run`. It's a sort of shortcut to bypass the "Created" state and automatically create and start a container. 

The usage of a container can be different depending on its pourpose. So, there can be various way to run containers. These are the three most common scenarios.

## 1. Run a container that executes a certain job and exits

For this scenario you can run the container like we did for the "Hello world" container: `docker run --name job my-custom-job:v1` 

## 2. Run a backgroud container - docker logs and -d option 

This can be the scenario of our inference app. We built a Docker image for our web app and we want to run a contaier, but we don't want to have our terminal locked on the container output stream. In this case, we can run the container in detached mode with the `-d` option.

Try it: `docker run --name my-app -p 80:80 -d docker-course-app`{{execute}}

You can manage the running container using commands like `docker stop`, `docker pause`, `docker kill` and so on.  All these commands have the same syntax `docker <action> <contaier-id/name>`, but they can have different options.

Now the container runs in background and you have your terminal free again. 
Don't worry, you can still read your container's log using the `docker logs` command.

Usage: `docker logs [OPTIONS] CONTAINER`

The docker logs command batch-retrieves logs present at the time of execution. A useful option is `-f` that allows you to follow the log output.

## 3. Run a container in an interactive way

Let's assume we need a simple Linux environment to experiment some Linux commands. Thanks to Docker we can run a container based on Linux using the `alpine` image. 

Try to run: `docker run --name my-linux alpine`{{execute}}

As you can see the container started and exited immediately. Our pourpose, instead, was to run the Linux image and interact with it. For this scenario, you can use the `-i` and `-t` option of `docker run` that allows you to use the interactive mode. Docker run command can start the process in the container and attach the console to the process’s standard input, output, and standard error.

Try this: `docker run --name my-interactive-linux -it alpine`{{execute}}

---

## docker exec command
So we discovered that it is possible to execute commands inside running containers with the interactive mode. It is possible to execute commands in background containers, for example? Yes, with `docker exec` command.

Usage: `docker exec [OPTIONS] CONTAINER COMMAND [ARG...]`

The docker exec command runs a new command in a running container.

The command started using docker exec only runs while the container’s primary process (PID 1) is running, and it is not restarted if the container is restarted.

COMMAND will run in the default directory of the container. If the underlying image has a custom directory specified with the WORKDIR directive in its Dockerfile, this will be used instead.

COMMAND should be an executable, a chained or a quoted command will not work. Example: `docker exec -ti my_container "echo a && echo b"` will not work, but `docker exec -ti my_container sh -c "echo a && echo b"` will.

We can use interactive mode also in `docker exec` command.

Let's try this with our web app.

Start the container: `docker run --name my-app -d docker-course-app`{{execute}}

We don't bind the container's port with a host's port, so we can't communicate with the app from the host. 

Now open a shell in it: `docker exec -it my-app bash`{{execute}} and send a request to the health endpoint. 

It works! Because we are executing commands from inside the container! Actually, opening a shell in a running container is a very useful and common operation, expecially at debug time. So, keep in mind this trick! 

