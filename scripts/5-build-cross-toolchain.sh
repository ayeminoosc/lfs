#!/bin/bash
set -e

export LFS_SCRIPT_ROOT=/opt/scripts/toolchain/5-cross-toolchain
/opt/scripts/generic-compile.sh binutils 2.36.1
/opt/scripts/generic-compile.sh gcc 10.2.0
/opt/scripts/generic-compile.sh linux 5.10.17
/opt/scripts/generic-compile.sh glibc 2.33
/opt/scripts/generic-compile.sh libstdc++ N/A gcc-10.2.0.tar.xz
