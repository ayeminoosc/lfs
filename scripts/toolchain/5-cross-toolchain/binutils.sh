#!/bin/bash
echo "Approximate build time: 1 SBU"
echo "Required disk space: 640 MB"

#echo "current directory "
#pwd
mkdir -v build
cd       build

../configure --prefix=$LFS/tools       \
             --with-sysroot=$LFS        \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror

make
make install