#!/bin/bash

# Root Priv Check
if [ "$(whoami)" != "root" ]; then
                echo "Sorry, you are not root."
                        exit 1
                fi
                
# Download and install
apt-get update && apt-get install wget git unzip
mkdir /c2 && cd /c2
wget https://c2.hak5.org/download/community && mv commmunity c2_community.zip
unzip c2_community
#Download GoVanguard C2 Files
git clone https://github.com/GoVanguard/c2_cloud.git
chown -R root c2_cloud
cp c2_cloud/usr/bin/c2_start.sh /usr/bin/c2_start.sh
cp c2_cloud/etc/systemd/system/hak5c2.service /etc/systemd/system/hak5c2.service
# Enable Service to run at boot
systemctl enable hak5c2.service
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

Echo "All set, run the c2_start.sh to get the initial setup token. Going forward you can use the "service hak5c2 start|stop|status" commands.

