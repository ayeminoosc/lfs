#!/bin/bash
set -e

LFS_SCRIPT_ROOT=/opt/scripts/toolchain/7-additional-temp-tools

$LFS_SCRIPT_ROOT/7.2-change-ownership.sh
$LFS_SCRIPT_ROOT/7.3-prepare-virtual-kfs.sh
$LFS_SCRIPT_ROOT/7.4-chroot.sh
$LFS_SCRIPT_ROOT/7.5-create-directory.sh
$LFS_SCRIPT_ROOT/7.6-essential-file-symlink.sh

/opt/scripts/generic-compile.sh libstdc++ N/A gcc-10.2.0.tar.xz
/opt/scripts/generic-compile.sh gettext 0.21
/opt/scripts/generic-compile.sh bison 3.7.5
/opt/scripts/generic-compile.sh perl 5.32.1
/opt/scripts/generic-compile.sh python N/A Python-3.9.2.tar.xz
/opt/scripts/generic-compile.sh texinfo 6.7
/opt/scripts/generic-compile.sh util-linux 2.36.2

