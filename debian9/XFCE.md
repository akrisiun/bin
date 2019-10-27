## Debian XFCE windows manager + VNC

```
sudo apt-get update 
sudo apt-get install -y libgtk-3-0
sudo apt-get install -y xfce4 xfce4-goodies tightvncserver -y
sudo apt-get install -y x11-apps
sudo apt-get install -y xvfb x11vnc xdotool wget tar supervisor net-tools

# dpkg-reconfigure x11-common
sudo /etc/init.d/x11-common restart

#untrusted X11 forwarding setup failed: xauth key data not generated
#tightvncserver
vncserver -geometry 1550x850 :2

#test 
xcalc
```

## /etc/X11/Xwrapper.config

This file has as setting called `allowed_users`
It can accept three values:

1. root
2. anybody
3. console

The above values are self explanatory. You can edit this value to set as anybody for normal user to start X server. If normal user starts X server from console, console can also be set. It can be like this.
allowed_users=anybody

In Debian and its derivatives like Ubuntu, you can run the following command to do it in user friendly screen as shown below.

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!

```
ssh-keygen -R {server.name.com}

sudo service --status-all | less 
```

OSX:
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
```
