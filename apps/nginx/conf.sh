#!/bin/bash
source $(pwd)/apps/nginx/common.sh

APP_CONF_D=$(pwd)/apps/$1/conf.d
NGINX_CONF_D=$(pwd)/apps/nginx/conf.d

# validate entry arguments
if (( $# < 1 )); then
    echo "Application not selected!"
    exit 1
fi

echo "docker container: [ $APP_NAME ] COPY CONFIGURATION FILES"
echo "docker container: [ $APP_NAME ] > source: $APP_CONF_D/*.conf"
echo "docker container: [ $APP_NAME ] > destination: $NGINX_CONF_D"
cp $APP_CONF_D/*.conf $NGINX_CONF_D

echo "docker container: [ $APP_NAME ] TEST CONFIGURATION"
docker exec -it "$APP_NAME" nginx -t
echo "docker container: [ $APP_NAME ] RELOAD"
docker exec -it "$APP_NAME" nginx -s reload
