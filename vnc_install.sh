#!/bin/bash

echo "Please enter the Ubuntu username followed by ENTER:"
read myuser
echo "Please enter the VNC password followed by ENTER:"
read mypasswd

sudo apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal 
sudo apt-get -y install x11vnc
mkdir /home/$myuser/.vnc
echo $mypasswd | vncpasswd -f > /home/$myuser/.vnc/passwd
chown -R $myuser:$myuser /home/$myuser/.vnc
chmod 0600 /home/$myuser/.vnc/passwd
x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/$myuser/.vnc/passwd -rfbport 5900 -shared
echo '
description "x11vnc"

start on runlevel [2345]
stop on runlevel [^2345]

console log

respawn
respawn limit 20 5

exec /usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/$myuser/.vnc/passwd -rfbport 5900 -shared' > /etc/init/x11vnc.conf

