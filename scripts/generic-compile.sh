#!/bin/bash
set -e
set -x
echo "Script root $LFS_SCRIPT_ROOT"
lib_name=$1
version=$2
filename=$3
cd "$LFS/sources"
if [ -z "$3" ]
  then
    echo "filename not supplied"
    pwd
    filename=$(find -type f -name "$lib_name-$version.tar.*");
    filename=${filename:2} # removing first 2 char
    echo "using filename $filename"
fi
tar -xf "$filename"
filename_only=${filename::-7}
cd "$filename_only"
"$LFS_SCRIPT_ROOT/$lib_name.sh"
cd "$LFS/sources"
rm -rf "$filename_only"
