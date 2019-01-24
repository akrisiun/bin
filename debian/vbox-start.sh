vboxmanage list runningvms

VBoxManage controlvm "MSEdge - Win10" savestate
VBoxManage startvm   "MSEdge - Win10" --type headless

vboxmanage list runningvms
nmap -v -n msedge
nmap -v -n 192.168.1.18
