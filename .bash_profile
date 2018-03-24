# rm ~/.bash_profile && ln -s ~/bin/.bash_profile ~/.bash_profile && . ~/.bash_profile
# -->  nano ~/.bashrc
# . ~/.bashrc

PS1='$(whoami)@$(hostname):$(pwd) $ '
export PS1
# export PS1=${debian_chroot:+($debian_chroot)}\u@\h:\w\$

DISPLAY=:0
export DISPLAY
#export DOCKER_HOST=unix:///private/var/run/docker.sock
FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/4.5
export FrameworkPathOverride 

# export DOCKER_HOST=tcp://192.168.1.19:2375
# export DOCKER_HOST=unix:///private/var/tmp/docker.sock
# export PATH="/usr/local/sbin:/Users/andriusk/.dotnet:/opt/local/bin:/opt/local/sbin:$PATH"

WINEDEBUG=-all
export WINEDEBUG
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
export PS1

# if OSX
alias services='brew services '
alias services-list='brew services list'
# services start nginx

# eval $(/usr/libexec/path_helper -s)

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]$(pwd) \$\[\033[00m\] '
# export PS1
export PATH="/usr/local/sbin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

