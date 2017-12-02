# code ~/Library/LaunchAgents/environment.plist
# defaults write com.apple.dt.Xcode UseSanitizedBuildSystemEnvironment -bool NO

export PS1='$(whoami)@$(hostname):$(pwd) $ '
export FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/4.5
export DISPLAY=:0
export DOCKER_HOST=unix:///private/var/run/docker.sock
# if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# MacPorts Installer addition on 2014-12-06_at_11:09:53: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
