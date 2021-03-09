# Docker Compose

### Creating volumes

To start correctly your application you need also volume for the model of backend service.
You can add this resources in docker-compose.yml

First define the volume name at the end of file. For this application we use the names `models-vol`

```
volumes:
  models-vol:
```

Then bind the defined module under the section of the backend container `dockerchurn`

```
...
volumes:
  - type: volume
    source: models-vol
    target: /app/models    
...
```

With this configuration you define:
- `source`: this is the name of the volume defined in configuration file
- `target`: this is the target path that you want to mount inside persistent volume; for this case
you can use `/app/module` which is the folder containing all input modules used by application
  

Now start you application 

`docker-compose up -d`{{execute}}

You can check the correct creation of the volume with this command 

`docker volume ls`{{execute}}

Check also the correct bind of the volume mounted using the inspection on container. In particular
in the `Mounts` section you can get information about name of the volume and target folder
specified in the docker-compose.yml

`docker inspect dockerchurn`{{execute}}

### Creating network

At this step, the application is not working yet because you miss the network configuration

Let's add in docker compose configuration file this resource. First you should 
define the `course_net`
network at the end of docker-compose

```
networks:
  course_net:
```

Then you must bind the two services to the network just defined. Here an example for `dockerchurn`
service

```
services:
  dockerchurn:
    build: .
    networks:
      - course_net
      ...
```

Finally, you need to specify a dependency between the tho services. In particular the frontend
service need that backend service is correctly running so that the api call is working. 
For this you must add the `depends_on` field

```
dockerchurn-fe:
  depends_on:
    - "dockerchurn"
```


After that you have the correct final version of docker-compose. Start the application and
check the results in the dashboard

`docker-compose up -d`{{execute}}

Check that network is created correctly with containers correctly bound

`docker network ls`{{execute}}

`docker network inspect dockerchurn_course_net`{{execute}}
 

At the end use this command to delete containers and network just created

`docker-compose down`{{execute}}

To remove also the volume, add the `--volumes` parameter

`docker-compose down --volumes`{{execute}}