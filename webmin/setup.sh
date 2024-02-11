#!/bin/bash

sudo apt update
sudo apt install -y wget
sudo sh -c 'echo deb http://download.webmin.com/download/repository sarge contrib > /etc/apt/sources.list.d/webmin.list'
wget -qO - http://www.webmin.com/jcameron-key.asc | sudo apt-key add -
sudo apt update

sudo apt install -y apt-show-versions
sudo apt install webmin -y

# /var/lib/apt/lists/_run_live_medium_dists_buster_main_binary-amd64_Packages: No such file or directory
ls /etc/apt/sources.list.d/
cat /etc/apt/sources.list.d/webmin.list

sudo /etc/init.d/webmin restart 
sudo lsof -i TCP -nP | grep LIST

echo "should webmin miniserv LISTEN :10000 ..."
