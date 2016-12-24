#!/bin/bash

sudo apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal 
sudo apt-get -y install vnc4server
vncserver :1
echo "gnome-panel &" >> ~/.vnc/xstartup
echo "gnome-settings-daemon &" >> ~/.vnc/xstartup
echo "metacity &" >> ~/.vnc/xstartup
echo "nautilus &" >> ~/.vnc/xstartup
(crontab -l ; echo "@reboot /usr/bin/vncserver :1")| crontab -
shutdown -r now
