#!/bin/bash
source $(pwd)/apps/_common.sh
source $(pwd)/apps/nodejs/_common.sh

container_remove $APP_NAME
