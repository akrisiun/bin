# -->  nano ~/.bashrc
# . ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
# source '/Users/andriusk/google-cloud-sdk/path.bash.inc'
# The next line enables bash completion for gcloud.
# source '/Users/andriusk/google-cloud-sdk/completion.bash.inc'
# source dnvm.sh
# code0 () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

export PS1='$(whoami)@$(hostname):$(pwd) $ '
export DISPLAY=:0
export DOCKER_HOST=unix:///private/var/run/docker.sock
export FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/4.5

# export DOCKER_HOST=tcp://192.168.1.19:2375
# export DOCKER_HOST=tcp://192.168.1.20:2375
# export DOCKER_CERT_PATH=/Users/andriusk/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

# export DOCKER_HOST=unix:///private/var/tmp/docker.sock
# MacPorts Installer addition on 2015-11-08_at_20:59:12: adding an appropriate PATH variable for use with MacPorts.

export PATH="/usr/local/sbin:/Users/andriusk/.dotnet:/opt/local/bin:/opt/local/sbin:$PATH"
# export PATH="$PATH:$HOME/.fastlane/bin"
export WINEDEBUG=-all
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
export FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/5.0.1/lib/mono/4.5

alias fuck='sudo $(history -p \!\!)'
alias services='brew services'
alias service='brew services list'

# Finished adapting your PATH environment variable for use with MacPorts.
eval $(/usr/libexec/path_helper -s)
