#!/bin/bash
source $(pwd)/apps/_common.sh
source $(pwd)/apps/nodejs/_common.sh

container_remove $APP_NAME

echo "docker container: [ $APP_NAME ] RUNNING"
docker run --name "$APP_NAME" -d \
  --restart=always \
  $3 \
  "$DOCKER_IMAGE:v$PCK_VERSION"
