# XRPD permissions fix

```
sudo /bin/dbus-daemon --system --nofork

sudo adduser xrdp ssl-cert
cp /etc/xrdp/*.pem /etc/xrdp/cpy
ls -l /etc/xrdp/cpy/

sudo chown xrdp /etc/xrdp/*.ini
sudo chown xrdp /etc/xrdp/startwm.sh
sudo rm /etc/xrdp/cert.pem
sudo rm /etc/xrdp/key.pem

cp /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/xrdp/cert.pem
cp /etc/ssl/private/ssl-cert-snakeoil.key  /etc/xrdp/key.pem

sudo chown xrdp /etc/xrdp/*.pem
sudo cp /etc/xrdp/*.pem /etc/xrdp/cpy/
ls -l /etc/xrdp/

sudo chown xrdp /etc/xrdp/*.sh
sudo chown xrdp /etc/xrdp/*.ini

tail -f /var/log/xrdp.log
```

#OTH

```
cat supervisord.conf
# sudo cp supervisord.conf /etc/supervisor
sudo apt install -y supervisor nano dbus-x11
sudo dpkg --configure -a
apt install -y xfce4
dpkg-reconfigure lightdm
```