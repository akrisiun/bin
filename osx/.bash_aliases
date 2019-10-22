# --- more aliases ----------------------
alias fuck='sudo $(history -p \!\!)'
alias services='brew services '
alias service='brew services list'
alias totalcmd='wine c:/bin/totalcmd/totalcmd.exe &'
alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'

# akeneo author dot files
# https://github.com/ronanguilloux/dotfiles/blob/master/.bash_aliases

alias ips='for ip in $(seq 1 254); do echo "1.$ip" && ping -c 1 -W 0.5 192.168.1.$ip ; [ $? -eq 0 ] && echo "192.168.$'

# alias wtf='tail -f /var/log/{dmesg,messages,*{,/*}{log,err}}'

alias ..="cd .."
alias ...="cd ../.."

alias la='ls -la'
alias l='ls -la'
# ?
alias lsd='ls -h --color --group-directories-first'
alias lsa='ls -A'           # affiche les fichiers cachés
alias ll='ls -lh'           # affiche en mode liste détail

alias semaine='date +%V'
alias ifif='sudo ifdown wlan0 && sudo ifup wlan0'
# alias screencast='ffmpeg -f x11grab -r 25 -s wxga -i :0.0 /tmp/outputFile.mpg'

#git
alias gpo='git push origin '
alias gs='git status'

# View HTTP traffic
# alias sniff="sudo ngrep -d 'en0' -t '^\(GET|POST\) ' 'tcp and port 8080'"
