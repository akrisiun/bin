#!/bin/zsh
# web nginx server listen servers check

# sudo systemctl restart nginx.service
sudo nginx -t
sudo cat /etc/nginx/sites-enabled/* | egrep "listen|server_n"

echo "curl http://localhost/.well-known/acme-challenge/"
curl http://localhost/.well-known/acme-challenge/
