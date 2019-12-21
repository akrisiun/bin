#!/bin/zsh

sudo /etc/init.d/x11-common restart 
export USER=andriusk
vncserver -geometry 1550x850 :2

sudo ps -aux | grep vnc | head -n 2
