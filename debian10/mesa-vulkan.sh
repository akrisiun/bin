#!/bin/bash

# set buster main-non-free contrib
# sudo nano /etc/apt/sources.list
cat "deb http://deb.debian.org/debian/ buster main contrib non-free"

cat /etc/apt/sources.list

sudo apt install xserver-xorg-video-amdgpu firmware-linux firmware-linux-nonfree libdrm-amdgpu1  -y
sudo apt install vulkan-tools vulkan-utils vulkan-validationlayers mesa-vulkan-drivers libvulkan1 -y
sudo apt install mesa-opencl-icd -y
