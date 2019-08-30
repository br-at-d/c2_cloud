#!/bin/bash
HOSTNAME=YOUR.URL.HERE
DBASE=c2
LPORT=8080
SSHPORT=2022

# Root Priv Check
if [ "$(whoami)" != "root" ]; then
                echo "Sorry, you are not root."
                        exit 1
                fi

#Ensure no existing c2 instances are running

killall c2_community-linux-arm7

#Start Hak5 C2 Community Edition

cd /c2/
./c2_community-linux-arm7 -db $DBASE -https -hostname $HOSTNAME -listenport $LPORT -sshport $SSHPORT
