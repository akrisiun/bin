
echo "nginx -T - show config (/etc/nginx/servers/*"
sudo nginx -T | grep -E 'listen|server |server_n' | grep -ve '#'
