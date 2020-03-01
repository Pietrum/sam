#!/bin/bash
source $(pwd)/apps/_common.sh
source $(pwd)/apps/gitlab-ce/_common.sh

container_remove $APP_NAME

echo "docker container: [ $APP_NAME ] RUNNING"
docker run --name "$APP_NAME" -d \
  --restart=always \
  -p $APP_PORT:80 \
  -v "$SCRIPTPATH/etc:/etc/gitlab" \
  -v "$SCRIPTPATH/opt:/var/opt/gitlab" \
  -v "$SCRIPTPATH/log:/var/log/gitlab" \
  $DOCKER_IMAGE
