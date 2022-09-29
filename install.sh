# upgrade system
DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y

# install nginx & jq & curl
apt install nginx jq curl -y

# create scripts directory
rm -r /scripts
mkdir /scripts

# configure nginx
rm /var/www/html/*

# create script file & index page
wget -O /scripts/update-iss-stats.sh https://raw.githubusercontent.com/mitchbecker/iss-server-scripts/main/update-iss-stats.sh

# create crontab
echo "* * * * * sh /scripts/update-iss-stats.sh" >> /var/tmp/cronconfig
crontab /var/tmp/cronconfig
rm /var/tmp/cronconfig
