#!/bin/sh
chmod 644 root/default.prop
chmod 644 root/init.rc
mkfs.ubifs -q -r system -m 2048 -e 126976 -c 512 -o system-ubifs.img 
ubinize -o system-ubi.img -m 2048 -p 128KiB ../../../../scripts/ubinize-system.cfg
