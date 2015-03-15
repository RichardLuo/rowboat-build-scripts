#!/bin/sh
################################################################
# file:   mkall.sh
# author: Richard Luo
# date:   2014-11-18 14:49:41
################################################################

(cd out/target/product/beagleboneblack/ && sh ../../../../makefs.sh)
sh ./gen_bootable_sdcard.sh 

