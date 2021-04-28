# What is Docker

**Docker** is a virtualization software. It allows running software inside isolated **containers** in a simple, fast and portable way.
The idea of container is older than Docker and different from the idea of virtual machines.

## Virtual machines VS Containers

Virtual machines are based on system virtualization, where a real computer can host more virtual machines, each with its own operating system. In this case, what is virtualized is the hardware.

![Vm stack](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part1/images/vms.png)

In container-based virtualization (or OS-level virtualization) we can think of a container as an entity including not only the hardware but also a virtual operating system kernel. This allows the containers to use the hosting machine kernel, and its real hardware.

![Containers stack](https://raw.githubusercontent.com/dcc-sapienza/katacoda-scenarios/master/docker/part1/images/containers.png)

A shared kernel in the host system handles all resources and containers. All containers share this kernel, but every one has its own operating system isolated from others. Isolation is achieved through some Unix tools like *containerd, runc, cgroups and namespace.*

As a consequence, containers are a lighter and faster than virtual machines because there is a lower overhead between the process inside the containers and the hardware. On the other hand, in order to use a container is necessary that the container OS is compatible with the hosting OS. This is the reason why you can't run a Windows container on Linux or MacOS.

## Docker containers

Containers are a standardized unit of software that allows developers to isolate their app from its environment, solving the “it works on my machine” headache. A container includes a software with all its configurations and dependencies. 

The best benefit of Docker is the portability. In fact, it's based on an open format (Open Container Initiative) which allows to package applications with all their configurations and dependencies in a portable entity. In addition, they can be deployed on various platforms: on-premises, cloud, Kubernetes. 

Other important benefits are:
- Isolation: for fault isolation and security
- Lightweight: they require less resources than VMs
- Container orchestration: compatible with systems like Kubernetes


**Ok, let's use containers!** In the text step we will use Docker to build our first container! 
