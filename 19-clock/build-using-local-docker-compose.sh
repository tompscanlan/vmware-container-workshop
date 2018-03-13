#!/bin/bash

# point at our local docker instance
# VCH doesn't support docker build yet
. ../local-mac-env.sh

# do the build locally
docker-compose build

# push to the secured registry
docker push vic.home.local/default-project/clock
