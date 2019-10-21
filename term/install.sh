#!/bin/zsh

# sudo 
echo "[sudo] apt-get install -y nodejs yarn"

apt-get install -y nodejs yarn

# For LTS Release
# sudo 
apt-get -y install curl software-properties-common
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -

# export PATH="/usr/bin:/opt/local/bin:/opt/local/sbin:$PATH"
# sudo dpkg-query -L nodejs
# sudo dpkg-query -L npm 
node -v
npm -v
yarn -v