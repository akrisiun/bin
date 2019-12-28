#!/bin/bash

lsof -i :5901
lsof -i :3389

# echo xfce4-session > ~/.xsession
# ln -s ~/bin/xrdp/xstartup ~/.vnc/xstartup

vncserver -kill :1

sudo rm /tmp/.X11-unix/X0
sudo rm /tmp/.X*
sudo rm -R /tmp/.X11-unix

vncserver -geometry 1550x850 :1 -alwaysshared -dpi 96 &


