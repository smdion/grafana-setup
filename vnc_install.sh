#!/bin/bash

echo "Please enter the Ubuntu username followed by ENTER:"
read myuser
echo "Please enter the VNC password followed by ENTER:"
read mypasswd

sudo apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal 
sudo apt-get -y install vnc4server
mkdir /home/$myuser/.vnc
echo $mypasswd | vncpasswd -f > /home/$myuser/.vnc/passwd
chown -R $myuser:$myuser /home/$myuser/.vnc
chmod 0600 /home/$myuser/.vnc/passwd
vncserver :1
echo "gnome-panel &" >> ~/.vnc/xstartup
echo "gnome-settings-daemon &" >> ~/.vnc/xstartup
echo "metacity &" >> ~/.vnc/xstartup
echo "nautilus &" >> ~/.vnc/xstartup
(crontab -l ; echo "@reboot /usr/bin/vncserver :1")| crontab -
shutdown -r now
