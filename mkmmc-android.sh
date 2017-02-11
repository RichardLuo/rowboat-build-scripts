#!/bin/bash

if [[ -z $1 ]]
then
	echo "mkmmc-android Usage:"
	echo "	mkmmc-android <device>"
	echo "	Example: mkmmc-android /dev/sdc"
	exit
fi

echo "All data on "$1" now will be destroyed! Continue? [y/n]"
read ans
if ! [ $ans == 'y' ]
then
	exit
fi

echo "[Unmounting all existing partitions on the device ]"

umount $1*

echo "[Partitioning $1...]"

DRIVE=$1
dd if=/dev/zero of=$DRIVE bs=1024 count=1024 &>/dev/null

SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`

echo DISK SIZE - $SIZE bytes

CYLINDERS=`echo $SIZE/255/63/512 | bc`

echo CYLINDERS - $CYLINDERS
{
echo ,-,0x0C,*
} | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE &> /dev/null

echo "[Making filesystems...]"

if [[ ${DRIVE} == /dev/*mmcblk* ]]
then
	DRIVE=${DRIVE}p
fi

mkfs.vfat -F 32 -n boot ${DRIVE}1 &> /dev/null

echo "[Done]"
