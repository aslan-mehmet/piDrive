#!/bin/bash
#Mehmet Aslan
#Licence: Everything is Allowed
#24 April 2021

source ./config.txt

ssh $pi 'sudo modprobe --remove g_mass_storage' #updating files not possible while module in use

echo "INFO: copying usbShare to piUSBDrive"
ssh $pi "mkdir -p /home/$userName/pi/RemoteUSBDrive/tmpUSBShare"
scp -r ./usbShare/* $pi:/home/$userName/piRemoteUSBDrive/tmpUSBShare

if [ $? != 0 ]
then
    echo "ERROR: files could not be copied check if pi is on network"
    exit 1
fi

echo "INFO: creating piUSBDrive with shared Files"
ssh $pi "cd /home/$userName/piRemoteUSBDrive && chmod 777 ./* && ./createUSB.sh"

if [ $? != 0 ]
then
    echo "ERROR: piUSBDrive creation failed"
else
    echo "INFO: piUSBDrive successfully created"
fi

read -n1 -p "please, press enter to exit"
