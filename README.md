# piky

A containerized yocto build intended for use with Raspberry Pi devices.

## Before building

* Define the environment variable `CUSTOM_LAYER_DIR` to the layer for your project. Must include a file named `conf/layer.conf`, but this file (and the rest of the directory) may be empty.
* Add settings such as `MACHINE` and parallel threads to `conf/local.conf`.
* If your custom layer uses private git repositories, ensure that the key is in `~/.ssh`.

## To build

    $ ./docker/build-image.sh
    $ ./docker/exec.sh ./scripts/setup.sh
    $ ./docker/oe-shell.sh
    > bitbake core-image-basic
