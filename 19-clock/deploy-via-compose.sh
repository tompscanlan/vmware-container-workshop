#!/bin/bash

# point docker to the VCH
. ../vch-env.sh

# pull the image from the secured registry to the VCH
docker pull vic.home.local/default-project/clock

# raise the service
docker-compose up -d
