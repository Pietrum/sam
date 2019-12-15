#!/bin/bash

NAME=nginx
NGINX=$(docker ps -a | grep "$NAME" | awk '{print $1}')
SCRIPTPATH="$( cd "$(dirname "$0")" || exit ; pwd -P )"

if  [ "$NGINX" ]
  then
    docker stop "$NGINX"
    docker rm "$NGINX"
fi

docker run --name "$NAME" -d \
  --restart=always \
  -p 80:80 \
  -v "$SCRIPTPATH/conf.d:/etc/nginx/conf.d" \
  -v "$SCRIPTPATH/../../sites:/etc/nginx/sites" \
  nginx
