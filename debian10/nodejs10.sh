#!/bin/bash

echo "NodeJs v10 for Debian 10 Buster"
echo "run:"
echo "sudo ~/bin/debian10/nodejs.sh"

curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

cd ~/bin/debian10
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource10_setup.sh

chmod +x nodesource10_setup.sh

./nodesource10_setup.sh
# public key is not available: NO_PUBKEY 1655A0AB68576280
# deb https://deb.nodesource.com/node_10.x buster main

apt-cache show  nodejs

apt install build-essential -y
sudo apt install nodejs -y
sudo apt autoremove

which node
node -v
which npm
npm -v

sudo rm    /usr/local/lib/node_modules
sudo ln -s /usr/lib/node_modules /usr/local/lib/node_modules 
ls /usr/local/lib/node_modules
sudo npm i -g optimist ansi-to-html

~/bin/http &

~/bin/myip.sh > ~/.index.html 
