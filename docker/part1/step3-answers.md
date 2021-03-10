## Exercise 1

To start a container based on the new "my-hello" image, you have to use the `docker run` command, for example
```bash
docker run --name my-hello-container my-hello
```
You can change the name if you want.

## Exercise 2

To rebuild the image, simply execute again the `docker build` command in the context of step2 path. 
```bash
docker build -t my-hello:latest .
``` 

Create and execute another container with this command:
```bash
docker run --name my-hello-container2 my-hello
```

## Exercise 3

Firstly, get all stopped containers:
```bash
docker ps -a
```

And then execute 
```bash
docker rm <id>
```

For every container id you want to remove. 

Another way is to execute 
```bash
docker rm $(docker ps -a -f status=exited -q)
```
This is a shorter command that removes all exited containers.
