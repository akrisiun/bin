# bash resources main script
# ln -s ~/bin/.bashrc ~/.bashrc
#####################################
# to reload:
# . ~/.bashrc
# . ~/bin/.bashrc

#PS1='\w\$ '
#PS1=$(whoami)@$(hostname):$(pwd) $
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '

WINEDEBUG=-all

rid='none'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   rid='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   rid='darwin'
fi

if [[ $rid == 'darwin' ]]; then
   # FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/5.0.1/lib/mono/4.5
   FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/4.5
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

echo "rid=$rid"
echo "TERM=$TERM"

# https://github.com/ronanguilloux/dotfiles/blob/master/.bashrc
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h :>: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# -------------------- GIT bashing --------------------
if [[ $rid == 'darwin' ]]; then

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
PS1="$GREEN\u@\h$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

# --- more aliases ----------------------
alias fuck='sudo $(history -p \!\!)'
alias services='brew services'
alias service='brew services list'
alias totalcmd='wine c:/bin/totalcmd/totalcmd.exe &'
alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'

alias fastips='for ip in $(seq 1 20); do echo "1.$ip" && ping -c 1 -W 0.5 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || :; done'
alias ips    ='for ip in $(seq 1 254); do echo "1.$ip" && ping -c 1 -W 0.5 192.168.1.$ip ; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || :; done'
# alias allIps='for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || : ; done'
# Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'

fi

# PATH ........
# export PATH=/home/ronan/Bin/android-sdk-linux_x86/tools:${PATH}
# export PATH=/home/ronan/Bin/android-sdk-linux_x86/platform-tools:${PATH}

# akeneo author dot files
# https://github.com/ronanguilloux/dotfiles/blob/master/.bash_aliases

alias ..="cd .."
alias ...="cd ../.."

alias la='ls -la'
alias l='ls -la'
# alias lsd='ls -h --color --group-directories-first'
alias lsa='ls -A'           # affiche les fichiers cachés
alias ll='ls -lh'           # affiche en mode liste détail

alias semaine='date +%V'
alias ifif='sudo ifdown wlan0 && sudo ifup wlan0'
alias screencast='ffmpeg -f x11grab -r 25 -s wxga -i :0.0 /tmp/outputFile.mpg'

#git
alias gpo='git push origin '
alias gs='git status'
# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"

# sdk
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/andriusk/bin/.sdkman"
[[ -s "/Users/andriusk/bin/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/andriusk/bin/.sdkman/bin/sdkman-init.sh"
