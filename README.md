# piUSBDrive

## Overwiev

These script allow to use raspberry pi zero wifi as a flash drive(g_mass_storage).
Flash drive contents are updatable from your pc using ssh via wifi.
Available on Windows and Linux.
On Windows works via [git bash](https://git-scm.com/downloads)

## How To Setup
1. Download raspberry pi OS. Write OS to SD card.
Add line "dtoverlay=dwc2" at the end of /boot/config.txt.
Eject SD card from your pc, then insert into raspberry pi.  
Hint: Dont forget to enable ssh server on raspberry pi
    ```console
    $ echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt
    $ sudo systemctl enable ssh
    ```
2. Connect cables  

    ![Alt text](doc/connections.png?raw=true "")  
3. Clone this repo. Then configure config.txt in pcRemoteUSBDrive and piRemoteUSBDrive  
    ```console
    $ git clone https://github.com/aslan-mehmet/piUSBDrive
    ```
4. Copy piUSBDrive/piRemoteUSBDrive to home folder of raspberry pi
    ```console
    $ cd piUSBDrive
    $ scp -r ./piRemoteUSBDrive <username>@<raspberrypi IP>:/home/<username>
    ```

## How To Use
1. Put your files in piUSBDrive/pcRemoteUSBDrive/usbShare  
2. Go to directory piUSBDrive/pcRemoteUSBDrive  
3. Execute connectUSB.sh  
    ```console
    $ cd piUSBDrive/pcRemoteUSBDrive
    $ cp <somefile> ./usbShare
    $ ./connectUSB.sh # for connecting usb drive
    $ ./disconnectUSB.sh # for disconnecting
    ```

## Tests
![Alt text](doc/testUbuntu.png?raw=true "")  
![Alt text](doc/testWin.PNG?raw=true "")  

