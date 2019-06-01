launchctl load -w ~/Library/LaunchAgents/net.web5000.plist 
launchctl load -w ~/Library/LaunchAgents/net.web9003.plist

launchctl start net.web5000.plist
launchctl start net.web9003.plist

launchctl list | grep net
lsof -i :5000
lsof -i :9003

cp net.web5005.plist ~/Library/LaunchAgents/net.web5005.plist
launchctl load -w ~/Library/LaunchAgents/net.web5005.plist
launchctl start net.web5005.plist

lsof -i :5005
