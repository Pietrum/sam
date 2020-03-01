#!/bin/bash
source $(pwd)/apps/common.sh
source $(pwd)/apps/redis/common.sh

container_remove $APP_NAME

echo "docker container: [ $APP_NAME ] RUNNING"
docker run --name "$APP_NAME" -d \
  --restart=always \
  -p $APP_PORT:6379 \
  -v "$SCRIPTPATH/data:/data" \
  -v "$SCRIPTPATH/redis.conf:/usr/local/etc/redis/redis.conf" \
  $DOCKER_IMAGE redis-server /usr/local/etc/redis/redis.conf
