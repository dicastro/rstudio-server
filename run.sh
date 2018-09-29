#!/bin/bash

CONTAINER_NAME=`cat container-name`
IMAGE_NAME=`cat image-name`
IMAGE_VERSION=`cat image-version`

docker run --name $CONTAINER_NAME -p 8787:8787 -v $CONTAINER_NAME-data:/home/rstudio -v /Users/dcastro/Documents/shared:/shared -d $IMAGE_NAME:$IMAGE_VERSION
#docker run -it --name $CONTAINER_NAME -p 8787:8787 -v $CONTAINER_NAME-data:/home/rstudio -v /Users/dcastro/Documents/shared:/shared $IMAGE_NAME:$IMAGE_VERSION bash