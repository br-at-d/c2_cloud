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
if [ -z "$HOSTNAME" ]
then
        echo "You must enter a FQDN"
        read HOSTNAME
fi
sed -i "s/YOUR.URL.HERE/${HOSTNAME}/g" /usr/bin/c2_start.sh

echo "What is your database name? (Press enter for the default "c2")?"
read DBASE
if [ -z "$DBASE" ]
then
        DBASE=c2
fi
sed -i "s/YOUR.DB.NAME/${DBASE}/g" /usr/bin/c2_start.sh

echo "What is your listening port? (Press enter for the default "8080")?"
read LPORT
if [ -z "$LPORT" ]
then
        LPORT=8080
fi
sed -i "s/YOUR.LPORT.NUMBER/${LPORT}/g" /usr/bin/c2_start.sh

echo "What is your ssh port? (Press enter for the default "2022")?"
read SSHPORT
read SSHPORT
if [ -z "$SSHPORT" ]
then
        SSHPORT=2022
fi
sed -i "s/YOUR.SSHPORT.NUMBER/${SSHPORT}/g" /usr/bin/c2_start.sh

chmod +x /usr/bin/c2_start.sh

echo "All set, run the /usr/bin/c2_start.sh manually to get the initial setup token. Going forward you can use the service hak5c2 start|stop|status commands."
