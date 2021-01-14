#!/bin/bash

echo "Vnc for debian/ubuntu apt installs"
sudo apt-get install xfce4 xfce4-goodies -y
# ls /usr/share/fonts/X11/
sudo apt-get install x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xvfb x11-apps -y
ps -aux

vncserver && cat ~/.vnc/localhost\:1.log
