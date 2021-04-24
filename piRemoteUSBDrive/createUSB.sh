#!/bin/bash
#Mehmet Aslan
#Licence: Everything is Allowed
#24 April 2021

source ./config.txt

if [ ! -f "piUSBDrive.img" ]
then
    echo "INFO: creating usb image on first run"
    /usr/sbin/mkfs.fat -n "piUSBDrive" -F 32 piUSBDrive.img -C $usbSize
fi

if [ ! -f "piUSBDrive.img" ]
then
    echo "ERROR: piUSBDrive.img not exist"
    exit 1
fi

mkdir -p piUSBDriveMnt
sudo mount ./piUSBDrive.img ./piUSBDriveMnt
echo "INFO: piUSBDrive.img mounted"

sudo rm -rf ./piUSBDriveMnt/*
echo "INFO: existing files removed from piUSBDrive.img"

sudo mkdir -p ./tmpUSBShare # this folder should already exist, just in case
sudo cp -r ./tmpUSBShare/* ./piUSBDriveMnt
echo "INFO: copied new shared files to piUSBDrive.img"

sudo umount ./piUSBDriveMnt
umountResult=$?
while [ $umountResult != 0 ]
do
    sudo umount ./piUSBDriveMnt
    umountResult=$?
    echo "WARNING:unmount piUSBDrive.img busy"
done
echo "INFO: unmounted piUSBDrive.img successfully"

rm -rf ./tmpUSBShare/*
echo "INFO: removed temp shared files"

sudo modprobe g_mass_storage file=piUSBDrive.img nofua=1 luns=1 ro=0 stall=0 removable=1 cdrom=0

if [ $? != 0 ]
then
    echo "ERROR: piUSBDrive connection failed"
    exit 1
else
    echo "INFO: piUSBDrive successfully connected"
fi