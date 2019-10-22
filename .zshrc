# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.

export ZSH="/Users/andriusk/.oh-my-zsh"
export KUBECONFIG=~/.kube/config

# bash:
# export PS1='$(whoami)@$(hostname):$(pwd) $ '
# zsh:
# export PROMPT="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%} "
# Short 
export PROMPT1="%F{yellow}%1 ~ %F{white}"
# .zsh with no oh-my-zsh
export PROMPT="%F{magenta}%n%f@%F{yellow}${${(%):-%m}#zoltan-}%f %F{yellow}%1~ %F{white}"

export FrameworkPathOverride="/usr/local/lib/mono/4.5"
# $env:FrameworkPathOverride="/usr/local/lib/mono/4.5"
# silver.yml
# aikube.yml

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
ZSH_DISABLE_COMPFIX="true"
VSCODE_PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# export PS1='[green][%* ] %n@%M:%d $ '
# unset PS1
# export PROMPT="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} $ "

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
# DISABLE_MAGIC_FUNCTIONS=true
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
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

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# For a full list of active aliases, run `alias`.
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="/usr/local/opt/llvm/bin:$PATH"
