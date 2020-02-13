#!/bin/bash

echo https://github.com/numixproject/numix-gtk-theme

echo "sudo apt install ruby-sass libglib2.0-dev libgdk-pixbuf2.0-dev libxml2-utils -y"

sudo apt install ruby-sass libglib2.0-dev libgdk-pixbuf2.0-dev libxml2-utils -y

xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"
xfconf-query -c xfwm4 -p /general/theme -s "Numix"

