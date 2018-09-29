#!/bin/bash

CONTAINER_NAME=`cat container-name`
IMAGE_NAME=`cat image-name`
IMAGE_VERSION=`cat image-version`

docker push $IMAGE_NAME:$IMAGE_VERSION