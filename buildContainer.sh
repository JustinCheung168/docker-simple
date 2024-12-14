#!/usr/bin/env bash
cd `dirname $0`

CONTAINER="simple-cpp"
USERNAME="default-user"




echo "Building container: ${CONTAINER}"

docker build -t ${CONTAINER} \
    --force-rm \
    --no-cache \
    --platform linux/amd64 \
    --build-arg USERNAME=${USERNAME} \
    .