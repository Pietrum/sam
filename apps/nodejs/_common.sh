#!/bin/bash

COMPANY=pietrum

PCK_NAME=$(node -p "require('./$1/package.json').name")
PCK_VERSION=$(node -p "require('./$1/package.json').version")

APP_NAME="$COMPANY-$2-$PCK_NAME"
IMAGE_NAME="$COMPANY/$2/$PCK_NAME"
