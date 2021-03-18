### Creating volumes

To correctly start your application you also need volume for the models of the backend service.
You can add this resource in `docker-compose.yml`

First, define the volume name at the end of file. For this application we use the names `models-vol`

```
volumes:
  models-vol:
```

Then bind the defined module under the section of the backend container `dockerchurn`

```
...
volumes:
      - models-vol:/app/models
...
```

If you use docker-compose 3.9 specification (see field `version` of docker-compose file)
you can add also these lines

```
...
volumes:
  - type: volume
    source: models-vol
    target: /app/models    
...
```

With this configuration you define:
- `source` or the first string `models-vol`: this is the name of the volume defined in configuration file
- `target` or the second string `/app/modules`: this is the target path that you want to mount inside
  persistent volume; for this case you can use `/app/module` which is the folder
  containing all input modules used by application
  

Now add the volumes lines configuration inside docker-compose or
copy the file `docker-compose-temp2.yml` with this command

`cp docker-compose-temp2.yml docker-compose.yml`{{execute}}

then start your application 

`docker-compose up -d`{{execute}}

You can check the correct creation of the volume with this command 

`docker volume ls`{{execute}}

Check also the correct bind of the volume mounted using the inspection on container. In particular,
in the `Mounts` section you can get information about name of the volume and target folder
specified in the docker-compose.yml

`docker inspect dockerchurn-container`{{execute}}

### Creating network

At this step, you can define also a custom network using docker compose configuration:

`docker-compose stop`{{execute}}


Now let's add in docker compose configuration file this resource. First you should 
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

Finally, you need to specify a dependency between the two services. In particular, the frontend
service needs that the backend service container is started so that the API call is working. 
For this you must add the `depends_on` field

```
dockerchurn-fe:
  depends_on:
    - "dockerchurn"
```

Use the text editor to add these lines or copy the file `docker-compose-temp3.yml` with this
command:

`cp docker-compose-temp3.yml docker-compose.yml`{{execute}}


At this point you have the correct final version of docker-compose. Start the application and
check the results in the dashboard

`docker-compose up -d`{{execute}}

Check that network is created correctly with containers that you need

`docker network ls`{{execute}}

`docker network inspect step2c_course_net`{{execute}}


At the end use check the result connecting to the port 8081 and
use this command to delete containers and network just created

`docker-compose down`{{execute}}

To remove also the volume, you can use also the `--volumes` parameter

`docker-compose down --volumes`{{execute}}