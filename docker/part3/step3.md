# Docker Compose
Docker Compose allows you to define and running multiple containers using a yaml file configuration.
With a single command in CLI you can start and stop different containers that share the same network
or resource.

Using Docker Compose you can easily deploy in local environment all the resources you need to test
your application. For example, you can create volumes, network or running containers defining them in 
yaml configuration file.

Compose has commands for managing the whole lifecycle of your application:
- Start and rebuild services
- View the status of your services
- Geting logs of running services

### Creating docker-compose.yaml
The first step is creating the configuration file for your environment. Let's try to create a compose
file for the project that you have just deployed in the previous step

You need to create the following resources:
- volume containers
- network
- running containers

For each resources you have to add a new section in docker compose file.

First create the configuration file

--INTERACTIVE--
creazione file

Add volumes for the model containers
--INTERACTIVE--
aggiunta volumi


Add network to connect containers each other
--INTERACTIVE--
aggiunta network

Add containers that compose your application
--INTERACTIVE--
aggiunta network

Now you can start all the containers with resources needed

--INTERACTIVE--
start compose

You can check the correct execution
--INTERACTIVE--
comando docker ps e sguardo ai log

Using this command you can stop all the containers
--INTERACTIVE--
comando di stop e vedere che tutte i containers sono stati stoppati