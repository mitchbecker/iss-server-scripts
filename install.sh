#!/bin/bash

# upgrade system
DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y

# install nginx & jq & curl
apt install nginx jq curl -y

# configure nginx
rm -r /var/www/html/*
wget -O /var/www/html/index.html https://raw.githubusercontent.com/medsteele/iss-server-scripts/main/index.html

# create scripts directory & download scripts
rm -r /scripts
mkdir /scripts
wget -O /scripts/install.sh https://raw.githubusercontent.com/medsteele/iss-server-scripts/main/install.sh
wget -O /scripts/update-webpage.sh https://raw.githubusercontent.com/medsteele/iss-server-scripts/main/update-webpage.sh

# create crontab
echo "* * * * * sh /scripts/update-webpage.sh" >> /var/tmp/cronconfig
crontab /var/tmp/cronconfig
rm /var/tmp/cronconfig
