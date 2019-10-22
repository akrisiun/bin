## Debian IP addr show/add 

```
  124  ip addr show enp0s8
  125  ip addr add 192.168.99.102/24 dev enp0s8
  126  ip addr show enp0s8
  127  ping 192.168.99.102
  128  ping 192.168.99.100
```

## VBoxManage create

```
$ 
VBoxManage dhcpserver modify --ifname vboxnet0 --disable
VBoxManage dhcpserver modify --ifname vboxnet0 --ip 192.168.99.3 --netmask 255.255.255.0 --lowerip 192.168.99.20 --upperip 192.168.99.203
VBoxManage dhcpserver modify --ifname vboxnet0 --enable

docker-machine create --driver "virtualbox" --virtualbox-cpu-count "2" \ 
         --virtualbox-disk-size "30000" --virtualbox-memory "1560" \ 
         --virtualbox-hostonly-cidr "192.168.99.3/24" dev


VBoxManage dhcpserver modify --ifname vboxnet0 --disable

VBoxManage dhcpserver modify --ifname vboxnet0 --ip 192.168.59.3 --netmask 255.255.255.0 --lowerip 192.168.59.103 --upperip 192.168.59.203

VBoxManage dhcpserver modify --ifname vboxnet0 --enable

docker-machine create --driver "virtualbox" --virtualbox-cpu-count "2" \ 
         --virtualbox-disk-size "30000" --virtualbox-memory "2560" \ 
         --virtualbox-hostonly-cidr "192.168.59.3/24" dev
```
