#!/usr/bin/env bash
cd `dirname $0`

CONTAINER="simple-cpp"
USERNAME="default-user"

VOLMAPDIR=$(pwd -P) # Give the container access to whatever level you ran this script from
WORKDIR=$(pwd -P) # Enter the container at this directory

echo "Entering container: ${CONTAINER}"

docker run --rm -it \
    -p 8888:8888 \
    -v ${VOLMAPDIR}:${VOLMAPDIR} \
    -w ${WORKDIR} \
    --user ${USERNAME} \
    ${CONTAINER} \
    /bin/bash