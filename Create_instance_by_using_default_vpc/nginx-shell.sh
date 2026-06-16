#!/bin/bash

apt-get update -y
apt-get install nginx -y

systemctl start nginx
systemctl enable nginx

echo "<h1>Hello Dosto Kaise Ho Aap Sab</h1>" > /var/www/html/index.html