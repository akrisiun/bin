#!/bin/zsh

# sudo nano /Library/Preferences/VMware\ Fusion/vmnet8/nat.conf
# sudo nano /Library/Preferences/VMware\ Fusion/vmnet8/dhcpd.conf

# ls -d ~/VM/*.vm*/*.vmx

export debian9_vm="/Users/andriusk/VM/Debian 9.x 64-bit 2.vmwarevm/Debian 9.x 64-bit 2.vmx"

echo $debian9_vm
echo "vmrun -T fusion start \$debian9_vm nogui &"
vmrun -T fusion start $debian9_vm nogui &

# ln -s /Applications/VMware\ Fusion.app/Contents/Library/vmrun ~
# /Applications/VMware\ Fusion.app/Contents/Library/
# vmrun -T fusion start ~/[IMAGENAME].vmwarevm/[IMAGENAME].vmx nogui
# vmrun -T fusion start ~/Documents/Virtual\ Machines.localized/[IMAGENAME].vmwarevm/[IMAGENAME].vmx nogui
# sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --stop
# sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --start 
