![LFS in VirtualBox](https://user-images.githubusercontent.com/1611077/33808510-16825dd2-dde8-11e7-9a1c-0ca0bc3ff2b5.png)

## Description

This repository contains docker configuration to build bootable iso
image with [Linux From Scratch 8.2](http://www.linuxfromscratch.org/lfs/downloads/8.2/LFS-BOOK-8.2.pdf).


## Status

At the moment, I don't have plans to update scripts to the latest LFS versions. However, pull requests are welcomed.

## Why

General idea is to learn Linux by building and running LFS system in
isolation from the host system.

## Structure

Scripts are organized in the way of following book structure whenever
it makes sense. Some deviations are done to make a bootable iso image.

## Build

Use the following command:

    docker build --tag lfs-ubuntu-host:10.1 .    
    docker build --tag ayeminoosc/lfs-ubuntu-host:10.1 . 

    docker build --tag ayeminoosc/lfs-toolchain:10.1 -f toolchain.dockerfile .
    docker run -it -v /home/ayeminoo/lfs-volume:/mnt/lfs --rm ayeminoosc/lfs-toolchain:10.1 /opt/scripts/5-build-cross-toolchain.sh
    docker run -it -v /home/ayeminoo/lfs-volume:/mnt/lfs --rm ayeminoosc/lfs-toolchain:10.1 /opt/scripts/6-build-temporary-tools.sh
    docker run -it -v /home/ayeminoo/lfs-volume:/mnt/lfs --rm ayeminoosc/lfs-toolchain:10.1 /opt/scripts/7-build-additional-tools.sh
        
or  
    docker build --build-arg LFS_SOURCES="$LFS_MIRROR_URL" --tag lfs-ubuntu-host:10.1 .                     
    
docker build --build-arg LFS_SOURCES="https://lfs-hk.koddos.net" --tag lfs-ubuntu-host:10.1 .                     

    sudo docker run -it --privileged --name lfs lfs:8.2 && \
    sudo docker cp lfs:/tmp/lfs.iso .
    # Ramdisk you can find here: /tmp/ramdisk.img

Please note, that extended privileges are required by docker container
in order to execute some commands (e.g. mount).

## Usage

Final result is bootable iso image with LFS system which, for
example, can be used to load the system inside virtual machine (tested
with VirtualBox).

## Troubleshooting

If you have problems with master branch, please try to use stable version from the latest release with toolchain from archive.

## License

This work is based on instructions from [Linux from Scratch](http://www.linuxfromscratch.org/lfs)
project and provided with MIT license.
