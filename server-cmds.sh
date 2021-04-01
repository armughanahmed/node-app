#!/usr/bin/env bash

export IMAGE=$1
docker run -p 3002:8080 -d $IMAGE
echo "success"
