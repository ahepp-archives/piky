#!/bin/bash

cd $(dirname $0)/..

mkdir -p sources
cd sources
git clone -b dunfell git://git.yoctoproject.org/poky
git clone -b dunfell git://git.openembedded.org/meta-openembedded
git clone -b dunfell git://git.yoctoproject.org/meta-raspberrypi
cd ..

mkdir -p build/conf
cp conf/local.conf build/conf
cp conf/bblayers.conf.part build/conf/bblayers.conf
echo "  /ws/sources/${CUSTOM_LAYER_NAME}\"" >> build/conf/bblayers.conf
