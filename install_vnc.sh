#!/bin/bash

echo "Please enter the VNC password followed by ENTER:"
read mypasswd

sudo apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal 
sudo apt-get -y install x11vnc
x11vnc -storepasswd $mypasswd ~/.vnc/passwd

cat <<EOF >/etc/init/x11vnc.conf
# description "Start x11vnc on system boot"
description "x11vnc"

start on runlevel [2345]
stop on runlevel [^2345]

console log

respawn
respawn limit 20 5

x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth ~/.vnc/passwd -rfbport 5900 -shared
EOF

shutdown -r now
