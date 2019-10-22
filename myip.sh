#!/bin/zsh

export n=9
# echo $argv
if [ $1="-f" ]; then
   export n=30
# else
fi

if [ $n=9 ]; then
   echo "~/bin/myip.sh:"
fi
printf "\n My external IP address: \e[1m"
curl -s http://ipecho.net/plain

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
printf "\n\e[36m ip route interface: "
ip route get 8.8.8.8 2>/dev/null| awk '{print $5}'
printf "\r \e[92mip addr show eth0\e[37m\n"
ip addr show eth0 | grep inet
printf "\e[35m "
ip addr show en0 | grep inet

# colors prinft:  [34 - blue, 31-red   35m - Magenta  92 -lt green  37m - lt gray
# \e[0m  reset  \e1m - bold
printf " \n"
~/bin/screenfetch-dev | head -n $n
printf "\n\e[0m"

# bash ~/bin/myip.sh -f > ~/index.html
# ~/bin/myhttp -p 3000