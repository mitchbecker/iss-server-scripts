#!/bin/bash

# upgrade system
DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y

# install nginx & jq & curl
apt install nginx jq curl -y

# configure nginx
rm -r /var/www/html/*
wget -O /var/www/html/index.html https://raw.githubusercontent.com/mitchbecker/iss-server-scripts/main/index.html

# create scripts directory & download scripts
rm -r /scripts
mkdir /scripts
wget -O /script/install.sh https://raw.githubusercontent.com/mitchbecker/iss-server-scripts/main/install.sh
wget -O /script/update-iss-stats.sh https://raw.githubusercontent.com/mitchbecker/iss-server-scripts/main/update-iss-stats.sh

# create crontab
echo "* * * * * sh /script/update-iss-stats.sh" >> /var/tmp/cronconfig
crontab /var/tmp/cronconfig
rm /var/tmp/cronconfig
