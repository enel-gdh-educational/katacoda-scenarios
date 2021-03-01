# Docker Network
You can use a Docker Newtwork to connect containers together.

You can create a network using this command

--INTERACTIVE--
docker network create -d bridge my-network

You can see the list of network in your docker environment using this command:

--INTERACTIVE--
docker network ls

In particular for each network of the list we have a recap of most important details about the
newtwork:
- name
- network id
- scope: it is the target environment of the network. For this purpose to connect containers running
  in a local environment, we have always the keyword local  
- driver: it describes the type of network driver that is the component that provides core network
  functionality to the containers. This is the default type of network
  you are creating if you don't specify the driver. Bridge networks are usually used when
  your applications run in standalone containers that need to communicate.

You can get useful information about docker network using the inspect command. Let's try to get
information about the network that you have just created

--INTERACTIVE--
docker network inspect my-network

The output contains the following useful information:
- Name: it's the name of the network
- Id: the unique id that identifies the network
- timestamp of creation
- driver: type of network driver
- Containers: list of containers in the network inspected; this value is useful for debug purpose


You can get the list of the created networks using the following command:
--INTERACTIVE--
docker network ls

### Add a container to a network
You can add a container to an existing docker network in the creation step of the container,
using the parameters --network

--INTERACTIVE--
$ docker run -itd --network=multi-host-network busybox

You can also add a container to a network while it is running, after the creation step

--INTERACTIVE--
docker network connect [OPTIONS] NETWORK CONTAINER

The following command remove a container from a network
--INTERACTIVE--
docker network disconnect [OPTIONS] NETWORK CONTAINER

### Connect multiple containers
In this section you can test and chek all the features and advantages of docker newtork
when you need to connect multipe connecting

Let's run the container of the model described in the previous step

-- INTERACTIVE --
chiamata di run dell'immagine dello step 1

Suppose you need a frontend service that calls the container model to get the last prediction data.
In this microservice you can see a property where you set the host and port of the
container that you want to connect

-- INTERACTIVE --
aprire dockerfile e mostrare puntamenti del microservice chiamato

Pull the image of the new microservice and run it.

-- INTERACTIVE --
pull/push immagine container frontend

-- INTERACTIVE --
run container

If you don't specify the network you can get an error when the frontend microservice try to 
call the model container

-- INTERACTIVE --
chiamata al primo container

You can fix this error including all the containers in the same network. You get the ip using the
inspection command or the label name of container

-- INTERACTIVE
docker connect per aggiungere i container alla rete




