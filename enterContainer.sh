#!/usr/bin/env bash

# Use this script's location as an absolute reference point.
cd `dirname $0`

# Assume this script is one directory under the top-level project that includes this repository.
PROJECT_ROOT=$(pwd -P)/..

# Name of the built image to enter.
IMAGE="simple-cpp"

# Name of the default user to enter the container as.
DEFAULT_USER="default-user"

# Directory to restrict access to.
VOLMAPDIR=${PROJECT_ROOT}

# Directory to enter the container at.
WORKDIR=${PROJECT_ROOT}

echo "Entering container of image: ${IMAGE}"

# Enter the container.
docker run --rm -it \
    -p 8888:8888 \
    -v ${VOLMAPDIR}:${VOLMAPDIR} \
    -w ${WORKDIR} \
    --user ${DEFAULT_USER} \
    ${IMAGE} \
    /bin/bash