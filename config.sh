#!/bin/bash 

cd /home/ubuntu/projectdir

source env/bin/activate
sudo fuser -k 8000/tcp

gunicorn --bind 0.0.0.0:8000 myfile.wsgi &>/dev/null & 

mv /home/ubuntu/myfile /etc/nginx/sites-available 

sudo ln -s /etc/nginx/sites-available/myfile /etc/nginx/sites-enabled/

sudo rm /etc/nginx//sites-enabled/default

sudo systemctl restart nginx

