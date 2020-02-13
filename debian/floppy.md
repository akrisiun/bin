# USB 

sudo modprobe usb_storage

# RM Floppy Legacy device

```
echo "blacklist floppy" | sudo tee /etc/modprobe.d/blacklist-floppy.conf 
sudo rmmod floppy 
sudo update-initramfs -u 
```      

