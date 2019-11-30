#!/bin/bash
#
# git clone https://github.com/akrisiun/bin

function help() {
    echo ./setup-x.sh  apt | chromium | start
    echo ./setup-x.sh  start_1
}

function apt() {
    # mc
    # su root
    apt-get update
    # su root
    #  visudo
    sudo apt-get update
    sudo apt install -y curl wget zsh net-tools dnsutils
    sudo apt install -y xfce4-goodies gnome-icon-theme tightvncserver
    sudo apt install -y xfce4-terminal 
    echo xfce4-session > ~/.xsession

    sudo chown andriusk /etc/xrdp/startwm.sh
    cat /etc/X11/Xsession
    hostname -I

    sudo apt-get purge xserver-xorg-legacy -y
    sudo apt install -y xrdp
    sudo dpkg -S xrdp

    # runlevel
    sudo apt install -y lightdm
    sudo apt install -y librsvg2-dev
}

function chromium() {
    # chromium-browser - no instalcation candidate problem
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    sudo apt-get update
    sudo apt --fix-broken install -y
    sudo apt install -y desktop-file-utils mime-support man-db fonts-liberation libu2f-udev

    sudo dpkg -i google-chrome-stable_current_amd64.deb

    sudo touch /bin/chrome  && sudo chown $USER /bin/chrome 
    echo "google-chrome ~ &" > /bin/chrome && chmod +x /bin/chrome 
    chrome &
}

function start() {
    sudo lightdm --show-config
    sudo lightdm --test-mode --debug

    sudo /etc/init.d/x11-common restart
    # vncserver -geometry 1550x850 :2
    # vncserver -geometry 1440x900 -alwaysshared -dpi 96 -localhost :1

    vncserver -kill :0
    rm /tmp/.X*
    rm /tmp/.X11-unix/X0
    vncserver -geometry 1650x950 :0 -alwaysshared -dpi 96
    # vncserver -geometry 1650x950 :1 -alwaysshared -dpi 96 -0.0.0.0

}

function trouble() {

    # icons, fonts
    ls /usr/share/fonts/X11/
    sudo apt  install  xfonts-base -y

    # librsvg package and updating your mime database:
    update-mime-database ~/.local/share/mime
    
    # RANDR
    xdpyinfo -display :0
    sudo dpkg -s xvfb
    xwininfo -root

}

function start_1() {

    vncserver -kill :1 &&  vncserver -geometry 1650x950 :1  -alwaysshared -dpi 96
    # -alwaysshared -dpi 96 -interface enp8s0

    tail -f /home/andriusk/.vnc/debian10:1.log
}

help 

