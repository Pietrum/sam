#!/bin/bash
source $(pwd)/apps/common.sh

APP_NAME=gitlab-ce
APP_PORT=3001
DOCKER_IMAGE=gitlab/gitlab-ce:latest
SCRIPTPATH="$( cd "$(dirname "$0")" || exit ; pwd -P )"

container_remove $APP_NAME

echo "docker container: [ $APP_NAME ] RUNNING"
docker run --name "$APP_NAME" -d \
  --restart=always \
  -p $APP_PORT:80 \
  -v "$SCRIPTPATH/etc:/etc/gitlab" \
  -v "$SCRIPTPATH/opt:/var/opt/gitlab" \
  -v "$SCRIPTPATH/log:/var/log/gitlab" \
  $DOCKER_IMAGE
