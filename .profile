#!/bin/bash
#
# . ~/bin/.profile

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
   PATH="$HOME/bin:$PATH"
fi
 
# export 
PATH="/usr/bin:/opt/local/bin:/opt/local/sbin:$PATH"

cat /etc/issue | tail -n 2
whoami
ip addr show | grep "inet 19"
echo "$PATH=" $PATH | tail -n 1

# . ~/bin/.bashrc 
if [ -n "$BASH_VERSION" ]; then
# include ~/bin/.bashrc if it exists, when shell is BASH 
  if [ -f "$HOME/bin/.bashrc" ]; then
     . "$HOME/bin/.bashrc"
  fi
# restore BASH prompt PS1  
  PS1="$GREEN\u@\h$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
  
#  if [
#     . ~/bin/bash_osx
#  fi
fi
