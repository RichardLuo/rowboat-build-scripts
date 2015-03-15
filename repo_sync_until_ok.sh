#!/bin/sh
################################################################
# file:   download.sh
# author: Richard Luo
# date:   2014-07-29 14:33:41
################################################################

repo sync
while [ $? -ne 0 ] 
do 
    sleep 4
    repo sync
done
