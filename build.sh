#!/bin/bash
source common.sh

DOCKER_NAME="$COMPANY/$2/$PCK_NAME"
DOCKER_BUILD=$(docker images | grep "$DOCKER_NAME" | grep "$PCK_VERSION" | awk '{print $1 ":" $2}')

if [ "$DOCKER_BUILD" ]
  then
    echo "Removing docker image $DOCKER_BUILD..."
    docker rmi "$DOCKER_BUILD"
fi

docker build --no-cache -f "dockerfiles/$2.Dockerfile" -t "$DOCKER_NAME:v$PCK_VERSION" $1
