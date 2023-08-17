#!/usr/bin/env bash
cd `dirname $0`

CONTAINER="simple"
USERNAME="jcheung"

CURDIR=$(pwd -P)
WORKDIR=/home/jcheung/Project

echo "Entering container: ${CONTAINER}"

docker run --rm -it -p 8888:8888 \
    -v ${CURDIR}/..:${WORKDIR} \
    -w ${WORKDIR} ${CONTAINER} \
    /bin/bash