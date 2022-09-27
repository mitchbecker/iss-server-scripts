#!/bin/bash
echo "current datetime: $(date) : " >> /var/www/html/index.html
curl http://api.open-notify.org/iss-now.json | jq .iss_position >> /var/www/html/index.html
echo "<br/>" >> /var/www/html/index.html
