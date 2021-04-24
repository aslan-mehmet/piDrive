#!/bin/bash
#Mehmet Aslan
#Licence: Everything is Allowed
#24 April 2021

source ./config.txt

ssh $pi 'sudo modprobe --remove g_mass_storage'

echo "INFO: removed piUSBDrive in case connected"
read -n1 -p "please, press enter to exit"