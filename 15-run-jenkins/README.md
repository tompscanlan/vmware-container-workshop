# Build a Jenkins server image for developer use

The `Dockerfile` in this directory can be used to build
a Jenkins server image for use on a developer's laptop that can
be used to build future images.  Docker, Jenkins plugins, and
some basic auth (user: admin, pass: admin) are configured in the image.

The run script mounts the local docker socket into the running
container so that Jenkins build in the container that use docker
will be scheduled on the local docker server, not the nested
docker server.

This image can't be used under vSphere Integrated Containers, as 
VIC doesn't support `docker build` at this point.

 
