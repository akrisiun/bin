# rm ~/.bash_profile && ln -s ~/bin/.bash_profile ~/.bash_profile && . ~/.bash_profile
# -->  nano ~/.bashrc
# . ~/.bashrc
# . ~/bin/.bash_profile
# . ./.bash_profile
# code0 () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

PS1='$(whoami)@$(hostname):$(pwd) $ '
export PS1
# export PS1=${debian_chroot:+($debian_chroot)}\u@\h:\w\$

DISPLAY=:0
export DISPLAY
#export DOCKER_HOST=unix:///private/var/run/docker.sock
#export FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/4.5

# export DOCKER_HOST=tcp://192.168.1.19:2375
# export DOCKER_HOST=tcp://192.168.1.20:2375
# export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=unix:///private/var/tmp/docker.sock

WINEDEBUG=-all
export WINEDEBUG

#export FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/5.0.1/lib/mono/4.5
#alias fuck='sudo $(history -p \!\!)'
# if OSX
alias serv='brew services '
alias service-list='brew services list'
alias services-list='brew services list'
# services start nginx

# Finished adapting your PATH environment variable for use with MacPorts.
# # if OSX
# eval $(/usr/libexec/path_helper -s)
# 34 -> 31 (blue)->red
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]$(pwd) \$\[\033[00m\] '
export PS1
export PATH="/usr/local/sbin:$PATH"
