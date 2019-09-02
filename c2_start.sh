#!/bin/bash
HOSTNAME=YOUR.URL.HERE
DBASE=YOUR.DB.NAME
LPORT=YOUR.LPORT.NUMBER
SSHPORT=YOUR.SSHPORT.NUMBER

# Root Priv Check
if [ "$(whoami)" != "root" ]; then
                echo "Sorry, you are not root."
                        exit 1
                fi

#Ensure no existing c2 instances are running

killall c2_community-linux-armv7

#Start Hak5 C2 Community Edition

cd /c2/
./c2_community-linux-armv7 -db $DBASE -https -hostname $HOSTNAME -listenport $LPORT -sshport $SSHPORT
