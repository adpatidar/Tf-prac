#!/bin/bash
apt update
apt install nginx -y
systemctl start nginx
echo "Hello " > /var/www/html/index.html

