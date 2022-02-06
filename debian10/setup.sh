#!/bin/bash
#
# ~/bin/debian9/setup.sh
#
echo "Install links to ~"

# echo "~/.tmux.conf"
# ln -s -f ~/bin/debian9/.tmux.conf ~/.tmux.conf

sudo apt-get install  -y openvpn curl wget zsh net-tools dnsutils

# https://github.com/http-party/http-server
#!/usr/bin/env node

# unsecure...
sudo chown andriusk /usr/local/bin

# curl https://raw.githubusercontent.com/http-party/http-server/master/bin/http-server > /usr/local/bin/http-server
# chmod +x /usr/local/bin/http-server
# http-server . -p 9099

# if [ -f "$FILE" ]; then
if not [ ! -f  /usr/local/bin/http ]; then
   ln -s ~/bin/http /usr/local/bin/http
fi

chmod +x /usr/local/bin/http
# http -p 3001
# ssh -L 3000:localhost:3000 $ip sleep 1d &

echo "chmod +x *.sh" > /usr/local/bin/chmod-sh
chmod +x /usr/local/bin/chmod-sh

echo "chmod +x *.sh" > /usr/local/bin/chmod-x
chmod +x /usr/local/bin/chmod-x
