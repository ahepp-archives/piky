#!/bin/bash

cd $(dirname $0)/..

source docker/docker.env

if [[ -z "${CUSTOM_LAYER_DIR}" ]] ; then
    echo "Warning: CUSTOM_LAYER_DIR has not been defined, using the default (~/meta-piky)"
    CUSTOM_LAYER_DIR=${HOME}/meta-piky
fi
CUSTOM_LAYER_NAME=$(basename ${CUSTOM_LAYER_DIR})

docker run --rm -it \
    --mount type=bind,source="$(pwd)",target=/ws \
    --mount type=bind,source="${HOME}/.ssh",target=/home/dev/.ssh \
    --mount type=bind,source="${CUSTOM_LAYER_DIR}",target=/ws/sources/${CUSTOM_LAYER_NAME} \
    --user 1000:1000 \
    --env CUSTOM_LAYER_NAME=${CUSTOM_LAYER_NAME} \
    "${IMAGE}" \
    bash -c ". sources/poky/oe-init-build-env build && bash"

