# ~/bin/lsof1.sh
sudo lsof -OnP | grep IPv4
lsof -i :433
sudo lsof -i :8000