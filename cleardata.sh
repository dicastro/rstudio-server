#!/bin/bash

CONTAINER_NAME=`cat container-name`

docker volume rm $CONTAINER_NAME-data
docker volume create $CONTAINER_NAME-data