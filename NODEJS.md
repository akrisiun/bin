## For Debian

Install nodejs v20 for Ubuntu/Debian

```
sudo apt install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings 
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg 
NODE_MAJOR=20 
# sudo apt remove nodejs
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list 

sudo apt install nodejs -y

source ~/.bashrc
export PS1="$ "
nvm -v
nvm install 10.17.0
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