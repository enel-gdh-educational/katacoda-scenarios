## Exercise 4

To build the new image use the `docker build` command in the step4 path, for example
```bash
docker build -t docker-course-app:latest .
```
Naturally you can change the tag.

## Exercise 5

Assuming we built the "ai-app" image, we can run two replicas of our application in this way:

`docker run --name app-replica1 -p 8080:5000 ai-app`

`docker run --name app-replica2 -p 8081:5000 ai-app`

now, to reach the application you can use `localhost:8080` or `localhost:8081`. 