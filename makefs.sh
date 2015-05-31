#!/bin/sh
################################################################
# file:   makefs.sh
# author: Richard Luo
# date:   2014-07-30 20:59:29
################################################################

rm -rf android_rootfs
mkdir android_rootfs
# the default.prop's chmod must be 644, otherwise, it won't be loaded by init
chmod 644 root/default.prop
cp -r root/* android_rootfs
cp -r system android_rootfs
chmod 644 android_rootfs/system/build.prop
../../../../build/tools/mktarball.sh ../../../host/linux-x86/bin/fs_get_stats android_rootfs . rootfs rootfs.tar.bz2
