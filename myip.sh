#!/bin/bash

export n=9
<<<<<<< HEAD
# echo $argv
if [ $1="-f" ]; then
=======

if [[ $1 = '-n' ]]; then
    export n=$2
fi
if [[ $1 = "-f" ]]; then
>>>>>>> origin/master
   export n=30
# else
fi

<<<<<<< HEAD
if [ $n=9 ]; then
   echo "~/bin/myip.sh:"
fi
=======
# https://linuxize.com/post/bash-if-else-statement/
# echo [ $argv 0=$0 1=$1 2=$2 n=$n ]
if [ $n -eq 8 ]; then
   echo "~/bin/myip.sh:"
fi

>>>>>>> origin/master
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
<<<<<<< HEAD
~/bin/screenfetch-dev | head -n $n
=======

if [ -f ~/bin/screenfetch-dev ]; then
    ~/bin/screenfetch-dev | head -n $n
else
   # echo ./screenfetch-dev + head -n $n
   ./screenfetch-dev | head -n $n
fi

>>>>>>> origin/master
printf "\n\e[0m"

# bash ~/bin/myip.sh -f > ~/index.html
# ~/bin/myhttp -p 3000
