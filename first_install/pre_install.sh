#!/bin/bash
apt update -y
apt install sudo curl wget -y
apt install libfuse2 -y
apt install -y xorgxrdp xrdp xserver-xorg-legacy
scp ./Xwrapper.config /etc/X11/Xwrapper.config
echo "... /n ... /n Pre_install updated succesfully"

