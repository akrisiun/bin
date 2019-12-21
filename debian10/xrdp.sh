#!/bin/zsh
# https://dev.to/darksmile92/linux-on-windows-wsl-with-desktop-environment-via-rdp-522g

sudo apt update && sudo apt -y upgrade
sudo apt-get -y install xfce4 xrdp

sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak-1

# sudo apt -y install kali-desktop-xfce

sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini

# sudo /etc/init.d/xrdp restart
