#!/bin/bash
# install-apache.sh
# by ktpickard on 2020-09-25

# Add apache to Ubuntu 18.04 LTS
sudo add-apt-repository ppa:ondrej/apache2
sudo apt update
sudo apt-get install apache2 -y
sudo apache2ctl -v
# Check that apache is running
sudo service apache2 status
# Edit apache.conf
cd /etc/apache2
echo "To list files, change these apache permissions"
echo "<Directory /var/www/html>"
echo "      Options Indexes FollowSymLinks Includes ExecCGI"
echo "      AllowOverride All"
echo "      Order deny,allow"
echo "      Require all granted"
echo "</Directory>"
read -p "Press enter to edit apache2.conf"
sudo vi apache2.conf
# Check the configuration
sudo apachectl configtest
# Restart apache
sudo service apache2 restart
