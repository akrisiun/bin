 #!/usr/bin/env /bash

echo "NodeJs v12 for Debian 10 Xenial 16.04"
echo "run:"
echo "sudo ~/bin/debian10/nodejs12.sh"
echo "\$USER=$USER \$OSTYPE=$OSTYPE \$SHELL=$SHELL"

sudo apt install curl git -y
sudo apt install apt-transport-https ca-certificates -y
# for method driver /usr/lib/apt/methods/https could not be found

curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource12_setup.sh

chmod +x ./nodesource12_setup.sh
./nodesource12_setup.sh
# public key is not available: NO_PUBKEY 1655A0AB68576280
# deb https://deb.nodesource.com/node_12.x buster main

apt-cache show nodejs
apt install build-essential -y
sudo apt install nodejs -y
sudo apt-get install gcc g++ make -y
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt remove nodejs
sudo apt install -y nodejs
sudo apt autoremove

which node
node -v
which npm
npm -v
sudo npm i -g yarn nan node-gyp --force

yarn -v
node-gyp -v
cp ../http ~/http

sudo rm    /usr/local/lib/node_modules
sudo ln -s /usr/lib/node_modules /usr/local/lib/node_modules
ls /usr/local/lib/node_modules
sudo npm i -g optimist ansi-to-html

/home/$USER/myip.sh > ~/.index.html

ps | grep http
/home/$USER/http  -p 3001 &
