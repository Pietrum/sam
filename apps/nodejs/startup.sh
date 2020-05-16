#!/bin/bash
source $(pwd)/apps/_common.sh
source $(pwd)/apps/nodejs/_common.sh

container_remove $APP_NAME

echo "docker container: [ $APP_NAME ] RUNNING"
docker run --name "$APP_NAME" -d \
  --restart=always \
  $3 \
  "$IMAGE_NAME:v$PCK_VERSION"
