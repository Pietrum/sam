#!/bin/bash
source common.sh

NAME="$COMPANY_$2_$PCK_NAME"
IMAGE="$COMPANY/$2/$PCK_NAME:v$PCK_VERSION"
DOCKER_BUILD=$(docker ps -a | grep "$NAME" | awk '{print $1}')

if  [ "$DOCKER_BUILD" ]
  then
    docker stop "$DOCKER_BUILD"
    docker rm "$DOCKER_BUILD"
fi

docker run --name "$NAME" -d \
  "$IMAGE"
