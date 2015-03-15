#!/bin/bash
################################################################
# file:   make_sd_image.sh
# author: Richard Luo
# date:   2014-07-30 21:04:48
################################################################

# $1 src file
# $2 dst dir
function safe_copy() {
    if [ ! -f $1 ]; then
        echo "file $1 doesn't exist!"
        exit 1
    fi

    if [ ! -d $2 ]; then 
        echo "dst dir $2 doesn't exist!"
        exit 1
    fi

    cp $1 $2
}

rm -rf image_folder
mkdir image_folder
# rootfs=out/target/product/am335xevm/rootfs.tar.bz2
rootfs=out/target/product/beagleboneblack/rootfs.tar.bz2
media_clips=external/ti_android_utilities/Media_Clips
mkmmc_script=external/ti_android_utilities/am335x/mk-mmc/mkmmc-android.sh

safe_copy uEnv.txt                     image_folder/
safe_copy kernel/arch/arm/boot/uImage  image_folder/
safe_copy u-boot/u-boot.img            image_folder/
safe_copy u-boot/MLO                   image_folder/
safe_copy $rootfs                      image_folder/
cp -a     $media_clips                 image_folder/
safe_copy $mkmmc_script                image_folder/

# (cd image_folder/ && \
#     sudo ./mkmmc-android.sh /dev/sdb1 MLO u-boot.img uImage uEnv.txt rootfs.tar.bz2 Media_Clips)

# ./mkmmc-android.sh /dev/sdddd MLO u-boot.img uImage uEnv.txt rootfs.tar.bz2 Media_Clips

