#!/bin/sh
################################################################
# file:   pre-install-packages.sh
# author: Richard Luo
# date:   2014-07-30 10:39:45
################################################################

# apt-get install git-core gnupg flex bison gperf build-essential \
#   zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
#   libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
#   libgl1-mesa-dev g++-multilib mingw32 openjdk-6-jdk tofrodos \
#   python-markdown libxml2-utils xsltproc zlib1g-dev:i386 \
#   minicom tftpd uboot-mkimage expect libgl1-mesa-dri

apt-get install git-core gnupg flex bison gperf build-essential \
  zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
  libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
  libgl1-mesa-dev g++-multilib mingw32 openjdk-6-jdk tofrodos \
  python-markdown libxml2-utils xsltproc zlib1g-dev:i386 \
  minicom tftpd uboot-mkimage expect libgl1-mesa-dri

  # $ sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
