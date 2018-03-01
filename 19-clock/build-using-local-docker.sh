#!/bin/bash

# point at our local docker instance
# VCH doesn't support docker build yet
. ../local-mac-env.sh

# do the build locally
docker build --tag clock .

# tag it and push it for a secured remote registry
docker tag clock vic.home.local/default-project/clock
docker push vic.home.local/default-project/clock

