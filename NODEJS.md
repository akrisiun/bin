## For Debian

Install nodejs v10 for debian

```
sudo apt-get install -y nodejs

# with Nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
# .nvm/*

source ~/.bashrc
export PS1="$ "
nvm -v
nvm install 10.0
nvm use 10.0

node -v
nvm -v
npm -v
npm i -g npm
npm i -g yarn
sudo npm i --global optimist 
```

# /usr/local/lib/node_modules/

```
echo $USER
ln -s /home/$USER/.nvm/versions/node/v10.0.0/lib/node_modules /usr/local/lib/node_modules
ls /usr/local/lib/node_modules
```