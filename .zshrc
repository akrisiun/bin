# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.

# /Users/andriusk/.oh-my-zsh
# export ZSH="/Users/andriusk/.oh-my-zsh"
export KUBECONFIG=~/.kube/config

# v10.16.3
export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#
# bash:
# export PS1='$(whoami)@$(hostname):$(pwd) $ '
# zsh:
# export PROMPT="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%} "
# Short
#export PROMPT1="%F{yellow}%1 ~ %F{white}"
# .zsh with no oh-my-zsh

export PROMPT="%F{magenta}%n%f@%F{yellow}${${(%):-%m}#zoltan-}%f %F{yellow}%1~ %F{white}"

# if OSX
# export FrameworkPathOverride="/usr/local/lib/mono/4.5"
# $env:FrameworkPathOverride="/usr/local/lib/mono/4.5"
# silver.yml

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
ZSH_DISABLE_COMPFIX="true"
VSCODE_PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
setopt RM_STAR_SILENT

# set -o RM_STAR_SILENT
# setopt
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*

plugins=(git)

# TODO: if
# source $ZSH/oh-my-zsh.sh
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="/usr/local/opt/llvm/bin:$PATH"
export LC_NUMERIC="en_LT"
export LC_TIME="en_LT"
export LC_COLLATE="en_LT"
export LC_MONETARY="en_LT"
export LC_MESSAGES="en_LT"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
