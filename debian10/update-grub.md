# Grub fix eth0 rename:

sudo nano /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

```
GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"

Generate a new grub file using the following command.

$ sudo grub-mkconfig -o /boot/grub/grub.cfg

Generating grub configuration file ...
Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported.
Found linux image: /boot/vmlinuz-4.4.0-15-generic
Found initrd image: /boot/initrd.img-4.4.0-15-generic
Found memtest86+ image: /memtest86+.elf
Found memtest86+ image: /memtest86+.bin
```
