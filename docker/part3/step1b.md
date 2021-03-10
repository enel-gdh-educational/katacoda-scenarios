#Docker Registry


### Docker tag
To push your image to a docker registry you must first name your local image.
A tag is an image name that gives you specific information about the different versions of the
same image.

`hostname/image_name:tag_name`

The name is made up slash-separated name components:
- `hostname` To push an image to a private registry and not the Docker Hub registry you 
  must tag it with the registry hostname and port (if needed).
- `image_name` Custom image name
- `tag name` It contains the version of the image; if it’s not specified, the tag defaults to latest.


You can tag local image by different ways:
- During building, using docker `build -t <hub-user>/<repo-name>[:<tag>]`
- By re-tagging an existing local image `docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]`
- By using `docker commit <existing-container> <hub-user>/<repo-name>[:<tag>]` to commit changes

You can use the following command to tag the existing image hello-world to push it to a 
third party repository. This will be useful for the next step of this course.
In this case you can use Enel `artifactorydocker.springlab.enel.com` **(\*)**.

-- insert screen --

To avoid conflicts
when you use Docker Enel Artifactory, please use your Enel Id in the tag name below:

`docker tag hello-world artifactorydocker.springlab.enel.com/enel-docker-course-img/hello-world-{Enel Id Number Axxxxxx}:v0.1`{{execute}}

**(\*): for the next steps, in order to use Enel Artifactory registry you must connect
to ENEL VPN. For this reason you must use your local pc with a version of Docker installed**







