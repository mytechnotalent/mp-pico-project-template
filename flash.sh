#! /bin/bash

sudo mkdir -p /media/kali/RPI-RP2
sudo mount /dev/sdb1 /media/kali/RPI-RP2
sudo cp firmware.uf2 /media/kali/RPI-RP2
sudo umount /media/kali/RPI-RP2
sudo rm -rf /media/kali/RPI-RP2
