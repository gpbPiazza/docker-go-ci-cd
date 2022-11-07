The previous YAML snippet contains a sequence of steps that:

Checks out the repository on the build machine.
Signs in to Docker Hub, using the Docker Login action and your Docker Hub credentials.
Creates a BuildKit builder instance using the Docker Setup Buildx action.
Builds the container image and pushes it to the Docker Hub repository, using Build and push Docker images.

The with key lists a number of input parameters that configures the step:

context: the build context.
file: filepath to the Dockerfile.
push: tells the action to upload the image to a registry after building it.
tags: tags that specify where to push the image.