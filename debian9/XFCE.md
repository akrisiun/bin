
## Debian XFCE windows manager + VNC

```
sudo apt-get update 
sudo apt-get install -y libgtk-3-0
sudo apt-get install -y xfce4 xfce4-goodies tightvncserver -y

dpkg-reconfigure x11-common
```

/etc/X11/Xwrapper.config – 

This file has as setting called “allowed_users”. 
It can accept three values:

1. root
2. anybody
3. console

The above values are self explanatory. You can edit this value to set as anybody for normal user to start X server. If normal user starts X server from console, console can also be set. It can be like this.
allowed_users=anybody

In Debian and its derivatives like Ubuntu, you can run the following command to do it in user friendly screen as shown below.

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!

ssh-keygen -R {server.name.com}

sudo service --status-all | less 

OSX:
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
chflags nohidden ~/Library
