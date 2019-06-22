# rm ~/.bash_profile && ln -s ~/bin/.bash_profile ~/.bash_profile && . ~/.bash_profile
# -->  nano ~/.bashrc
# . ~/.bashrc
# . ~/bin/debian/.bash_profile

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
export DISPLAY=:0

#export DOCKER_HOST=unix:///private/var/run/docker.sock
#export FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/4.5

# export DOCKER_HOST=tcp://192.168.1.20:2375
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=unix:///private/var/tmp/docker.sock
export PATH="/usr/local/sbin:/Users/andriusk/.dotnet:/opt/local/bin:/opt/local/sbin:$PATH"

#alias fuck='sudo $(history -p \!\!)'
#alias services-list='brew services list'
# services start nginx

# Finished adapting your PATH environment variable for use with MacPorts.
# if OSX
# eval $(/usr/libexec/path_helper -s)

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '

