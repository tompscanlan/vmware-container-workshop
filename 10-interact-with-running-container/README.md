# Build

You have built the image we will run in a prior step.

# Run

This will run the container in daemon mode.  It will print out an id
that you can use to reference the running container.

    docker run --name 10-interact-with-running-container -d -p 8080:80 05-basic-dockerfile:latest

# Use

Open a web browser to http://localhost:8080/ to see to following:

![Using it](../05-basic-dockerfile/use.png)

## Start a shell inside the container

    docker exec -it 10-interact-with-running-container bash

## Change the index page

    echo '<h1>Hello, there!</h1>' > /var/www/index.html

Then open a browser as above to http://localhost:8080/ to see:

![Using it](hello.png)

## Stop and clean up

    docker stop 10-interact-with-running-container
    docker rm 10-interact-with-running-container

## Create a new one and see change lost

    docker run --name 10-interact-with-running-container -d -p 8080:80 05-basic-dockerfile:latest

Open a web browser to http://localhost:8080/ to see the change rolled back:

![Using it](../05-basic-dockerfile/use.png)
