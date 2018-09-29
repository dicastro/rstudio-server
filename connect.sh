#!/bin/bash

CONTAINER_NAME=`cat container-name`

docker exec -it $CONTAINER_NAME bash