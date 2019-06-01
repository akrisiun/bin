launchctl load -w ~/Library/LaunchAgents/net.web9003.plist

launchctl start ~/Libarary/LaunchAgents/net.web9003.plist
launchctl list | grep net
lsof -i :9003

# cp net.web5005.plist ~/Library/LaunchAgents/net.web5005.plist
