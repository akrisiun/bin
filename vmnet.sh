#!/bin/zsh
# sudo ~/vmnet.sh

/Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --stop
/Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --start

# sudo nano /Library/Preferences/VMware\ Fusion/networking
cat /Library/Preferences/VMware\ Fusion/networking

netstat -atn | grep tcp4 | grep "*.*"

# xrdp: https://github.com/twhtanghk/docker.xrdp/blob/master/Dockerfile
# apt-get -y install lxde-core lxterminal xrdp iceweasel 
# ln -s /usr/share/doc/xrdp/rsakeys.ini /etc/xrdp

# sudo /etc/init.d/xrdp start && tail -F /var/log/xrdp-sesman.log
