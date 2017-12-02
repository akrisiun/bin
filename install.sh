
mv ~/.vimrc   ~/.backup_vimrc
mv ~/.bashrc  ~/.backup_bashrc

ln -s .vimrc ~/.vimrc

# rm ~/.bashrc
# /.bashrc: Too many levels of symbolic links
# ln -s .bashrc ~/.bashrc
mv .bashrc ~/.bashrc
ln -s ~/.bashrc $PWD/.bashrc

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
. ~/.bashrc

