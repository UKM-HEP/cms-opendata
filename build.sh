#!/bin/bash

set -e

DOCKER_USER="siewyanhoh"
FILE=$(basename $1)
NAME=$(basename -s .Dockerfile $1)
VERSION="latest"

# build docker
echo docker build -f $FILE -t $DOCKER_USER/${NAME,,}:${VERSION} .
docker build -f $FILE -t $DOCKER_USER/${NAME,,}:${VERSION} .
