#!/bin/bash
set -e

LFS_SCRIPT_ROOT=/opt/scripts/toolchain/6-temorary-tools

/opt/scripts/generic-compile.sh m4 1.4.18
/opt/scripts/generic-compile.sh ncurses 6.2
/opt/scripts/generic-compile.sh bash 5.1
/opt/scripts/generic-compile.sh coreutils 8.32
/opt/scripts/generic-compile.sh diffutils 3.7
/opt/scripts/generic-compile.sh file 5.39
/opt/scripts/generic-compile.sh findutils 4.8.0
/opt/scripts/generic-compile.sh gawk 5.1.0
/opt/scripts/generic-compile.sh grep 3.6
/opt/scripts/generic-compile.sh gzip 1.10
/opt/scripts/generic-compile.sh make 4.3
/opt/scripts/generic-compile.sh patch 2.7.6
/opt/scripts/generic-compile.sh sed 4.8
/opt/scripts/generic-compile.sh tar 1.34
/opt/scripts/generic-compile.sh xz 5.2.5
/opt/scripts/generic-compile.sh binutils 2.36.1
/opt/scripts/generic-compile.sh gcc 10.2.0
