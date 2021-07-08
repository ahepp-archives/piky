#!/bin/bash

cd $(dirname $0)/..

source docker/docker.env

if [[ -z "${CUSTOM_LAYER_DIR}" ]] ; then
    echo "Warning: CUSTOM_LAYER_DIR has not been defined, using the default (~/meta-piky)"
    CUSTOM_LAYER_DIR=${HOME}/meta-piky
fi

docker run --rm -it \
    --mount type=bind,source="$(pwd)",target=/ws \
    --mount type=bind,source="${CUSTOM_LAYER_DIR}",target=/ws/sources/$(basename ${CUSTOM_LAYER_DIR}) \
    --user 0:0 \
    "${IMAGE}" \
    bash

