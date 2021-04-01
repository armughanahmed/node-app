#!/usr/bin/env bash

export IMAGE=$1
docker run -d -p 3002:8080 $IMAGE
echo "success"
