### Linux (Debian too) brew http://linuxbrew.sh/
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sudo apt-get install build-essential curl file git python-setuptools
brew doctor
git clone -b debian https://github.com/akrisiun/bin ~/bin
```

## Install sequence (macOS)
```
git clone -b debian https://github.com/akrisiun/bin ~/bin
rm ~/.bash_profile && ln -s ~/bin/.bash_profile ~/.bash_profile 
. ~/.bash_profile
cd ~/bin

=======
### Linux (Debian too) brew http://linuxbrew.sh/
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sudo apt-get install build-essential curl file git python-setuptools
brew doctor
git clone -b debian https://github.com/akrisiun/bin ~/bin
```

## Install sequence (macOS)
```
git clone -b debian https://github.com/akrisiun/bin ~/bin
rm ~/.bash_profile && ln -s ~/bin/.bash_profile ~/.bash_profile 
. ~/.bash_profile
cd ~/bin
```