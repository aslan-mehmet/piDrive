# piUSBDrive

## Overwiev

Use raspberry pi as a flash drive(g_mass_storage) from your pc  
Available on Windows and Linux  
On Windows works via [git bash](https://git-scm.com/downloads)

## How To Setup
1. Connect cables  

    ![Alt text](doc/connections.png?raw=true "")  
2. Configure config.txt in pcRemoteUSBDrive and piRemoteUSBDrive  
3. Execute below shell commands  
    ```console
    $ git clone https://github.com/aslan-mehmet/piUSBDrive
    $ cd piUSBDrive
    $ scp -r ./piRemoteUSBDrive <username>@<raspberrypi IP>:/home/<username>
    ```

## How To Use
1. Put your files in piUSBDrive/pcRemoteUSBDrive/usbShare  
2. Go to directory piUSBDrive/pcRemoteUSBDrive  
3. Execute connectUSB.sh  
    ```console
    $ #on terminal
    $ cd piUSBDrive/pcRemoteUSBDrive
    $ cp <somefile> ./usbShare
    $ ./connectUSB.sh # for connecting usb drive
    $ ./disconnectUSB.sh # for disconnecting
    ```

## Tests
![Alt text](doc/testUbuntu.png?raw=true "")  
![Alt text](doc/testWin.PNG?raw=true "")  

