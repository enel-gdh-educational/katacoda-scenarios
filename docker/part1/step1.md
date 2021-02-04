# What is Docker

**Docker** is a virtualization software. It allows running software inside isolated **containers** in a simple, fast and portable way.
The idea of container is older than Docker and is different from the idea of virtual machine.

## Virtual machines VS Containers

Virtual machines are based on system virtualization, where a real computer can host more virtual machines, every one with his own operating system. In this case what is virtualized is the hardware.

![Vm stack](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part1/images/vms.png)

In container-based virtualization (or OS-level virtualization) we can think that a container is an entity that include not only hardware but also a virtual operating system's kernel. So containers use the kernel of the real machine, as they use the real hardware.

![Containers stack](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part1/images/containers.png)

There is a shared kernel in the host system that handle all the resources of host system and containers. All containers share this kernel, but every one has his own operating system and is isolated from others. Isolation is achieved through some Unix tools like *containered, runc, cgroups and namespace.*

So containers are a lighter and faster than virtual machines, because there is a lower overhead between the process inside the containers and the hardware. But to use a container is necessary that the container's OS is compatible with the host OS. This is the reason why you can't run a Windows container on Linux or MacOS.

## Docker containers

Containers are a standardized unit of software that allows developers to isolate their app from its environment, solving the “it works on my machine” headache. A container includes a software with all his configurations and dependencies. 

The best benefit of Docker is the portability. In fact, it's based on an open format (Open Container Initiative) and that allow to package applications with all his configurations and dependencies in a portable entity. In addition, they can be deployed on various platforms: on-premises, cloud, Kubernetes. 

Other important benefits are:
- Isolation: for fault isolation and security
- Lightweight: they require less resources than VMs
- Container orchestration: compatible with systems like Kubernetes


**Ok, let's use containers!** In the text step we will use Docker for building our first container! 