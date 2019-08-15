# rm ~/.bash_profile && ln -s ~/bin/.bash_profile ~/.bash_profile && . ~/.bash_profile
# . ~/.bashrc
# INSTALL:
# cp .bashrc ~/.bashrc

# debian EXPORT:
export 'PS1=${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
DISPLAY=:0

