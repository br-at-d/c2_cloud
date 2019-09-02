#!/bin/bash

# Root Priv Check
if [ "$(whoami)" != "root" ]; then
                echo "Sorry, you are not root."
                        exit 1
                fi
                
# Download and install
wget https://c2.hak5.org/download/community && mv community c2_community.zip
mkdir /c2
unzip c2_community.zip -d /c2
rm c2_community.zip

# Copy files to their needed locations
cp c2_start.sh /usr/bin/c2_start.sh
cp hak5c2.service /etc/systemd/system/hak5c2.service

# Enable Service to run at boot
systemctl enable hak5c2.service

# Set the variable values for the c2 server
echo "What is your site's URL (without http(s)://)?"
read HOSTNAME
sed -i "s/YOUR.URL.HERE/${HOSTNAME}/g" /usr/bin/c2_start.sh

echo "What is your database name? (enter "c2" for the default)?"
read DBASE
sed -i "s/YOUR.DB.NAME/${DBASE}/g" /usr/bin/c2_start.sh

echo "What is your listening port? (enter "8080" for the default)?"
read LPORT
sed -i "s/YOUR.LPORT.NUMBER/${LPORT}/g" /usr/bin/c2_start.sh

echo "What is your ssh port? (enter "2022" for the default)?"
read SSHPORT
sed -i "s/YOUR.SSHPORT.NUMBER/${SSHPORT}/g" /usr/bin/c2_start.sh

chmod +x /usr/bin/c2_start.sh

echo "All set, run the /usr/bin/c2_start.sh manually to get the initial setup token. Going forward you can use the service hak5c2 start|stop|status commands."
