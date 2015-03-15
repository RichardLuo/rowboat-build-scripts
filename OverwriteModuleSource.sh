#!/bin/sh
################################################################
# file:   CopyRepoModules.sh
# author: Richard Luo
# date:   2014-08-07 10:50:15
################################################################



function copy_one_module() {
    local src=$1
    local dst=$2

    if [ "X"$src = "X" ]; then
        echo "please specify src module"
        exit 1
    fi

    if [ "X"$dst = "X" ]; then
        echo "please specify dst module"
        exit 1
    fi

    if [ ! -d $src ]; then
        echo "src module $src is not a dir"
        exit 1
    fi

    if [ ! -d $dst ]; then
        echo "dst module $dst is not a dir"
        exit 1
    fi

    if ! mv $dst $dst.bak; then
        echo "ERR: failed on exec mv $dst $dst.bak"
        exit 1
    fi

    if ! rsync -av --exclude=/.git $src/ $dst; then
        echo "ERR: failed on exec: rsync -av --exclude=.git $src/ $dst"
        exit 1
    fi        

    if ! rsync -av $dst.bak/.git $dst/; then
        echo "ERR: failed on exec: rsync -av $dst.bak/.git $dst/"
        exit 1
    fi        

    rm -rf $dst.bak

    echo "================ finished copy $src's source to $dst ================ "
}


# copy_one_module $1 $2

SRC_ROOT=/data/livelydroid
DST_ROOT=/data/xlive

# copy_one_module       $SRC_ROOT/abi/cpp/      $DST_ROOT/abi/cpp

# copy_one_module         $SRC_ROOT/frameworks/mff/       $DST_ROOT/frameworks/mff
# copy_one_module         $SRC_ROOT/frameworks/native/    $DST_ROOT/frameworks/native
# copy_one_module         $SRC_ROOT/frameworks/opt/emoji/ $DST_ROOT/frameworks/opt/emoji
# copy_one_module         $SRC_ROOT/frameworks/opt/carddav/       $DST_ROOT/frameworks/opt/carddav
# copy_one_module         $SRC_ROOT/frameworks/X-Live/    $DST_ROOT/frameworks/X-Live
# copy_one_module         $SRC_ROOT/frameworks/base/      $DST_ROOT/frameworks/base


# copy_one_module         $SRC_ROOT/system/security/      $DST_ROOT/system/security
# copy_one_module         $SRC_ROOT/system/bluetooth/     $DST_ROOT/system/bluetooth
# copy_one_module         $SRC_ROOT/system/media/ $DST_ROOT/system/media
# copy_one_module         $SRC_ROOT/system/core/  $DST_ROOT/system/core
# copy_one_module         $SRC_ROOT/system/netd/  $DST_ROOT/system/netd
# copy_one_module         $SRC_ROOT/system/extras/        $DST_ROOT/system/extras
# copy_one_module         $SRC_ROOT/system/vold/  $DST_ROOT/system/vold


# copy_one_module         $SRC_ROOT/external/libjingle/third_party/alsa_headers/  $DST_ROOT/external/libjingle/third_party/alsa_headers
# copy_one_module         $SRC_ROOT/external/libjingle/third_party/openssl/       $DST_ROOT/external/libjingle/third_party/openssl
# copy_one_module         $SRC_ROOT/external/libjingle/third_party/       $DST_ROOT/external/libjingle/third_party
# copy_one_module         $SRC_ROOT/external/libjingle/net/       $DST_ROOT/external/libjingle/net
# copy_one_module         $SRC_ROOT/external/libjingle/talk/      $DST_ROOT/external/libjingle/talk
# copy_one_module         $SRC_ROOT/external/libjingle/tools/     $DST_ROOT/external/libjingle/tools
# copy_one_module         $SRC_ROOT/external/libjingle/build/     $DST_ROOT/external/libjingle/build
# copy_one_module         $SRC_ROOT/external/libjingle/           $DST_ROOT/external/libjingle

copy_one_module         $SRC_ROOT/build/     $DST_ROOT/build