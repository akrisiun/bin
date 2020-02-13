
### Install

```
sudo apt install -y cifs-utils
```
# 2 Mount SMB with mount.nfs
# Mount SMB with mount.nfs to /mnt directory.

```
$ SMB_USERNAME=guest
$ SMB_PASSWORD=guest
$ SMB_SERVER="//smb-server.hiroom2.com/share"
$ sudo mount -t cifs \
       -o username=${SMB_USERNAME},password=${SMB_PASSWORD} \
       "${SMB_SERVER}" /mnt

mkdir /mnt/server
chown $USER /mnt/server
sudo mount -t cifs -o username=${USER},password=${PASS} "\\\\server\\share" /mnt/server
```