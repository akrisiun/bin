# bin

My config and binary files for Windows/Osx/Linux

```
git clone https://github.com/akrisiun/bin/
ln -s ~/bin/.bashrc ~/.bashrc

# or 
# git remote rm origin 
git remote add origin https://github.com/akrisiun/bin/
git branch --set-upstream-to=origin/wsl wsl

git branch --set-upstream-to=origin/win64 win64
```

## Hello world VIM

curl https://raw.githubusercontent.com/akrisiun/bin/master/.vimrc > ~/.vimrc

ln -s ~/bin/.vimrc ~/.vimrc
```
" Use :q!   : tells vim to execute command q 
" save: w 
" :help !   : help 
" shift + O : insert mode (im) , exit im - <Esc>
" set im /  : set noim
" Vimrc: clone:
" curl https://raw.githubusercontent.com/wklken/vim-for-server/master/vimrc > ~/.vimrc
```
