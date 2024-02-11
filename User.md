new user in Debian/Ubuntu

`
cat /etc/issue

adduser $USER

sudo usermod -a -G admin $USER

ssh -i ~/.ssh/id_ed25519 

mkdir .ssh
touch authorized_keys

`
