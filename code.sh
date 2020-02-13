#!/bin/zsh

if [ -f /snap/bin/code ] ; then  
# if debian
    /snap/bin/code $@
else
# if macOS
    open /Applications/Visual\ Studio\ Code.app/ $@
fi

# $@ - bash ?
# %* - means all

