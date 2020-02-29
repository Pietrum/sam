#!/bin/bash
source $(pwd)/apps/common.sh
source $(pwd)/apps/nginx/common.sh

container_remove $APP_NAME

echo "docker container: [ $APP_NAME ] RUNNING"
docker run --name "$APP_NAME" -d \
  --restart=always \
  -p $APP_PORT:80 \
  -v "$SCRIPTPATH/conf.d:/etc/nginx/conf.d" \
  -v "$SCRIPTPATH/../../sites:/etc/nginx/sites" \
  $DOCKER_IMAGE
