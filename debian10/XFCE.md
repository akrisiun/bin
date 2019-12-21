## Debian XFCE windows manager + VNC

```
sudo apt-get update 
sudo apt-get install -y libgtk-3-0
sudo apt-get install -y xfce4 xfce4-goodies tightvncserver -y

dpkg-reconfigure x11-common

#/etc/X11/Xwrapper.config – 
#
#This file has as setting called “allowed_users”. 
# =======
sudo apt-get install -y x11-apps
sudo apt-get install -y xvfb x11vnc xdotool wget tar supervisor net-tools
sudo apt-get install -y xauth xorg  net-tools x11-apps dnsutils
# /etc/X11/Xwrapper.config –  This file has as setting called “allowed_users”. 
sudo dpkg-reconfigure x11-common
sudo /etc/init.d/x11-common restart

#untrusted X11 forwarding setup failed: xauth key data not generated
#tightvncserver
vncserver -geometry 1550x850 :2

#test 

xcalc
```

## /etc/X11/Xwrapper.config

```
# This file has as setting called `allowed_users`
allowed_users=anybody

ssh-keygen -R {server.name.com}

sudo service --status-all | less 
```

## OSX:

```
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
chflags nohidden ~/Library
```

## supervisord

https://github.com/solarkennedy/wine-x11-novnc-docker/blob/master/supervisord.conf

```
export LC_ALL=C.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# dpkg --add-architecture i386
sudo apt-get update 
sudo apt-get -y install xvfb x11vnc xdotool wget tar supervisor net-tools
#wine32-development  fluxbox
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

```
# RUN

```
sudo /etc/init.d/x11-common restart
sudo ps -aux | grep vnc

vncserver -geometry 1550x850 :2

# rm ~/.vnc/debian10\:0.pid
vncserver -kill :0
sudo ls /tmp/.X*
sudo ls /tmp/.X11-unix/X0
vncserver -geometry 1650x950 :0
```
