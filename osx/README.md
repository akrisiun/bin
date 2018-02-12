## Clean macOS install steps, with Ruby and Brew.sh (Homebrew) package manager

brief: brew, iterm, git, xquartz, wine, nginx, npm, dotnet

```
xcode-select --install
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > ~/bin/osx/install.rb
# wget https://raw.githubusercontent.com/Homebrew/install/master/install
# /usr/bin/ruby -e "$(curl ..)"
cd ~/bin/osx
ruby ./install.rb
brew doctor
brew update
echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.bash_profile
```

### Osx single line install (after Xcode) http://brew.sh
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

### Linux (Debian too) brew http://linuxbrew.sh/
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sudo apt-get install build-essential curl file git python-setuptools
brew doctor
git clone -b debian https://github.com/akrisiun/bin ~/bin
```

## Install sequence (macOS)
```
git clone -b osx https://github.com/akrisiun/bin ~/bin
rm ~/.bash_profile && ln -s ~/bin/.bash_profile ~/.bash_profile 
. ~/.bash_profile
cd ~/bin

df -h
open /Applications/Visual\ Studio\ Code.app .

#### ####################
brew install wget curl mc

mc
chmod +x screenfetch-dev 
ln -s ~/bin/screenfetch-dev /usr/local/bin/screenfetch-dev
xscreenfetch-dev

## 
cd ~/bin/
brew install winetricks
export DISPLAY=:0
winetricks dotnet45
pwd
cd ~/.wine/drive_c/bin/

defaults write org.macosforge.xquartz.X11 nolisten_tcp 0
defaults write org.macosforge.xquartz.X11 app_to_run /usr/bin/true

brew install mc
brew install nano npm nodejs
ls
brew update
```

## X11 Xquartz , for $DISPLAY run from macOS

```
defaults write org.macosforge.xquartz.X11 nolisten_tcp 0
defaults write org.macosforge.xquartz.X11 app_to_run /usr/bin/true
xhost +$(docker-machine ip)
xauth list

winetricks --unattended corefonts tahoma
winetricks fontsmooth=rgb
```

## more WINE for macOS 

wine 2.0.4

```
brew install wine
brew cask install xquartz

wine start 
winecfg
wine cmd
pwd

winecfg
winetricks fontsmooth=rgb
./wine32.sh 
wine cmd
/usr/local/Cellar/wine/2.0.4/bin/wine ; exit;
```

### NGINX

```
brew services list

brew install nginx
sudo nginx stop
sudo nginx
brew services stop nginx
```

### More - Wine (32) setup tasks & tricks & commander 
```
WINEPREFIX="$HOME/bin/wine" WINEARCH=win32 wine wineboot
brew install -y wine winetricks

winetricks --unattended corefonts tahoma
winetricks fontsmooth=rgb

# install Totalcmd
cd $WINEPREFIX/drive_c
pwd

mkdir bin
wget http://tcmd900.s3.amazonaws.com/tcmd900ax32.exe
wine c:/bin/tcmd900ax32.exe
```

# Start commander 
```
export WINEPREFIX="$HOME/bin/wine"
export WINEARCH=win32
#export WINEARCH=win64
export DISPLAY=:0
wine c:/bin/totalcmd/totalcmd.exe &
```

## dotnet45
`winetricks dotnet45`

# Single line

```
export WINEPREFIX=~/bin/winenet45 
WINEARCH=win32 wine c:/bin/totalcmd/totalcmd.exe &

WINEARCH=win64 wine c:/bin/totalcmd/totalcmd.exe &
``` 

## Wine advanced: boot install.sh

`echo "WINEPREFIX="$HOME/bin/winenet45" WINEARCH=win32 wine wineboot" >> wineinstall.sh`
