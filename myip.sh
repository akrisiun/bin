#!/bin/bash

export n=9
# echo $argv
if [[ $1 = '-n' ]]; then
    export n=$2
fi

if [[ $1 = "-f" ]]; then
   export n=30
# else
fi

if [ $n=9 ]; then
   echo "~/bin/myip.sh:"
fi
# https://linuxize.com/post/bash-if-else-statement/
# echo [ $argv 0=$0 1=$1 2=$2 n=$n ]
if [ $n -eq 8 ]; then
   echo "~/bin/myip.sh:"
fi

date
echo "\$OSTYPE=$OSTYPE  SHELL=$SHELL"
printf "\n My external IP address: \e[1m"
curl -s http://ipecho.net/plain

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
printf "\n\e[36m ip route interface: "
ip route get 8.8.8.8 2>/dev/null| awk '{print $5}'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # ...
    printf "\r \e[92mip addr show eth0\e[37m\n"
    ip addr show eth0 | grep inet
elif [[ "$OSTYPE" == "darwin18" ]]; then
    # Mac OSX
    printf "\e[35m ifconfig en0\e[37m\n"
    # ip addr show
    ifconfig en0 | grep inet
elif [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
    # Raspberry ARM
    ifconfig eth0 | grep inet
#elif [[ "$OSTYPE" == "cygwin" ]]; then
#    # POSIX compatibility layer and Linux environment emulation for Windows
#elif [[ "$OSTYPE" == "msys" ]]; then
#    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen: Windows
    ifconfig /all
else
    printf "\e[35m Unknown IP (OSTYPE=$OSTYPE)"
fi

# colors prinft:  [34 - blue, 31-red   35m - Magenta  92 -lt green  37m - lt gray
# \e[0m  reset  \e1m - bold
printf " \n"

if [ -f ~/bin/screenfetch-dev ]; then
   # echo "bash ~/bin/screenfetch-dev:"
   /bin/bash -c ~/bin/screenfetch-dev | head -n $n
else
   # echo ./screenfetch-dev + head -n $n
   ./screenfetch-dev | head -n $n
fi

printf "\n\e[0m"

# bash ~/bin/myip.sh -f > ~/index.html
# ~/bin/myhttp -p 3000
