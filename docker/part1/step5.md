# Dockerfile commands recap

## FROM
`FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]` 

The FROM instruction initializes a new build stage and sets the Base Image for subsequent instructions. As such, a valid Dockerfile must start with a FROM instruction.  The optional --platform flag can be used to specify the platform of the image in case FROM references a multi-platform image. For example, linux/amd64, linux/arm64, or windows/amd64.

---

## ENTRYPOINT

ENTRYPOINT has two forms:

The _exec_ form, which is the preferred form:

`ENTRYPOINT ["executable", "param1", "param2"]`
    

The _shell_ form:

`ENTRYPOINT command param1 param2`

The ENTRYPOINT instruction specifies the executable program that will be executed in the container. Its syntax is `ENTRYPOINT [ "command", "param1", "param2", ...]`. Usually a Dockerfile starts with FROM instruction and ends with an ENTRYPOINT.

Command line arguments to `docker run <image>` will be appended after all elements in an exec form ENTRYPOINT, and will override all elements specified using CMD. You can override the ENTRYPOINT instruction using the `docker run --entrypoint` flag.

The shell form prevents any CMD or run command line arguments from being used, but has the disadvantage that your ENTRYPOINT will be started as a subcommand of /bin/sh -c, which does not pass signals. This means that the executable will not be the container’s PID 1 - and will not receive Unix signals - so your executable will not receive a SIGTERM from `docker stop <container>`.

Only the last ENTRYPOINT instruction in the Dockerfile will have an effect.

---

## CMD

The CMD instruction has three forms:

`CMD ["executable","param1","param2"]` (exec form, this is the preferred form)

`CMD ["param1","param2"]` (as default parameters to ENTRYPOINT)

`CMD command param1 param2` (shell form)

There can only be one CMD instruction in a Dockerfile. If you list more than one CMD then, only the last CMD will take effect. The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable, or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.

Unlike the shell form, the exec form does not invoke a command shell. This means that normal shell processing does not happen. For example, CMD [ "echo", "$HOME" ] will not do variable substitution on $HOME. If you want shell processing then either use the shell form or execute a shell directly, for example: CMD [ "sh", "-c", "echo $HOME" ]. When using the exec form and executing a shell directly, as in the case for the shell form, it is the shell that is doing the environment variable expansion, not docker.

---

## COPY

`COPY [--chown=<user>:<group>] <src>... <dest>`

The COPY instruction copies new files or directories from `<src>` and adds them to the filesystem of the container at the path `<dest>`. The `--chown` feature is only supported on Dockerfiles used to build Linux containers, and will not work on Windows containers. Since user and group ownership concepts do not translate between Linux and Windows, the use of /etc/passwd and /etc/group for translating user and group names to IDs restricts this feature to be only available for Linux OS-based containers.

---

## RUN

RUN has 2 forms:

`RUN <command>` (shell form, the command is run in a shell, which by default is /bin/sh -c on Linux or cmd /S /C on Windows)

`RUN ["executable", "param1", "param2"]` (exec form)

The RUN instruction will execute any command in a new layer on top of the current image and will commit the results. The resulting committed image will be used for the next step in the Dockerfile. The exec form makes it possible to avoid shell string munging, and to RUN commands using a base image that does not contain the specified shell executable.

The default shell for the shell form can be changed using the SHELL command.

---

## EXPOSE

`EXPOSE <port> [<port>/<protocol>...]`

The EXPOSE instruction informs Docker that the container listens on the specified network ports at run-time. You can specify whether the port listens on TCP or UDP, and the default is TCP if the protocol is not specified.

The EXPOSE instruction does not actually publish the port. It functions as a type of documentation between the person who builds the image and the person who runs the container, it shows which ports are intended to be published. To actually publish the port when running the container, use the -p flag on docker run to publish and map one or more ports, or the -P flag to publish all exposed ports and map them to high-order ports.

---

## ENV

`ENV <key>=<value> ...`

The `ENV` instruction sets the environment variable `<key>` to the value `<value>`. This value will be in the environment for all subsequent instructions in the build stage and can be replaced inline in many ways as well. The value will be interpreted for other environment variables, so quote characters will be removed if they are not escaped. Like command line parsing, quotes and backslashes can be used to include spaces within values.

---

## WORKDIR

`WORKDIR /path/to/workdir`

The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction.

The WORKDIR instruction can be used multiple times in a Dockerfile. If a relative path is provided, it will be relative to the path of the previous WORKDIR instruction.