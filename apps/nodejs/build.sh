#!/bin/bash
source $(pwd)/apps/_common.sh
source $(pwd)/apps/nodejs/_common.sh

image_remove "$IMAGE_NAME" "v$PCK_VERSION"

echo "docker image: [ $IMAGE_NAME ] BUILD"
docker build --no-cache \
  --network=host \
  -f "$(pwd)/apps/nodejs/dockerfiles/$2.Dockerfile" \
  -t "$IMAGE_NAME:v$PCK_VERSION" \
  "$1"
