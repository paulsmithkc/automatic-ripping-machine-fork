#!/bin/bash

docker buildx build -t arm-build .
docker container rm arm

docker run -it \
   -p "8080:8080" \
   -e ARM_UID="1000" \
   -e ARM_GID="1000" \
   --name "arm" \
   arm-build:latest
