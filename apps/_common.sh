#!/bin/bash

# constant
SCRIPTPATH="$( cd "$(dirname "$0")" || exit ; pwd -P )"

# remove image container
function image_remove() {
  ID=$(docker images | grep "$1" | grep "$2" | awk '{print $3}')

  if  [ "$ID" ]; then
    echo "docker image: [ $APP_NAME ] REMOVING IMAGE $ID"
    docker rmi "$ID" &> /dev/null
  fi
}

# remove running container
function container_remove() {
  ID=$(docker ps -a | grep "$1" | awk '{print $1}')

  if  [ "$ID" ]; then
    echo "docker container: [ $APP_NAME ] STOPING $ID"
    docker stop "$ID" &> /dev/null
    echo "docker container: [ $APP_NAME ] REMOVING $ID"
    docker rm "$ID" &> /dev/null
  fi
}
