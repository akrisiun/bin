#!/bin/zsh

git config --global user.name "Andrius-K"
git config --global user.email akrisiun@gmail.com

# zsh
brew install zsh zsh-completions

# rm -R ~/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "#" > ~/.oh-my-zsh/om-my-zsh.sh
chmod +x ~/.oh-my-zsh/om-my-zsh.sh

# rm ~/.zshrc
ln -s ~/bin/.zshrc ~/.zshrc
source ~/.zshrc

cd ~/.oh-my-zsh/
git clone https://github.com/powerline/fonts.git --depth=1
~/.oh-my-zsh/fonts/install.sh
#font: 
#dejavu sans mono for powerline

# VsCode for mac
ln -s ~/Library/Application\ Support/Code/User/settings.json ~/bin/osx/settings.json
ln -s ~/bin/code.sh  /usr/local/bin/code.sh 
chmod +x ~/bin/code.sh
chmod +x /usr/local/bin/code.sh 
