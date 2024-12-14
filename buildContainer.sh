#!/usr/bin/env bash

# Use this script's location as an absolute reference point.
cd `dirname $0`

# A name for the image.
IMAGE="simple-cpp"

# A name for the default user of the image.
DEFAULT_USER="default-user"

echo "Building image: ${IMAGE}"

# Build the image.
docker build -t ${IMAGE} \
    --force-rm \
    --no-cache \
    --platform linux/amd64 \
    --build-arg DEFAULT_USER=${DEFAULT_USER} \
    .