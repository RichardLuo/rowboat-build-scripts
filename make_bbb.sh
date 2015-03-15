#!/bin/sh
################################################################
# file:   make_bbb.sh
# author: Richard Luo
# date:   2014-07-31 10:41:25
################################################################

make TARGET_PRODUCT=beagleboneblack droid kernel_build  -j4
# make TARGET_PRODUCT=beagleboneblack rowboat
# make TARGET_PRODUCT=beagleboneblack droid  -j4
