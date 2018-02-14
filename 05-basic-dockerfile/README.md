# Build

    docker build -t 05-basic-dockerfile:latest .

# Run

This will run the container but keep your console session attached to the
container.  Use `ctl-c` to kill to container when done

    docker run --rm -p 8080:80 05-basic-dockerfile:latest

# Use

Open a web browser to http://localhost:8080/ to see to following:

![Using it](use.png)