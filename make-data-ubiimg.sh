#!/bin/sh
mkfs.ubifs -q -r data -m 2048 -e 126976 -c 2048 -o data-ubifs.img
ubinize -o data-ubi.img -m 2048 -p 128KiB ../../../../scripts/ubinize-data.cfg
