# c2_cloud

Forked from https://github.com/GoVanguard/c2_cloud 

This will download and configure the Hak5 C2 Cloud Community edition server for most Linux systems with TLS enabled via Let’s Encrypt. 
The install script allows for the customization all the C2 settings, as well as accepting the defaults.

Currently the setup process is configured to run the C2 server on a Raspberry Pi 3 (c2_community-linux-armv7), however this can easily be changed by editing c2_start.sh to use the C2 server version of your choice.

Setup has been tested on a Raspberry Pi 3 Model B+ running DietPi v6.25.3 (https://dietpi.com)
