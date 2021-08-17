#!/bin/bash

echo "Approximate build time: 0.1 SBU"
echo "Required disk space: 1.1 GB"

make mrproper

make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr

