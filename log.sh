#!/bin/bash

CONTAINER_NAME=`cat container-name`

docker logs -f $CONTAINER_NAME