#!/bin/bash

echo "Please enter the VNC password followed by ENTER:"
read mypasswd

sudo apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal 
sudo apt-get -y install x11vnc
x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth ~/.vnc/passwd -rfbport 5900 -shared
x11vnc -storepasswd ~/.vnc/passwd

echo "# description "Start x11vnc on system boot"

description "x11vnc"

start on runlevel [2345]
stop on runlevel [^2345]

console log

respawn
respawn limit 20 5

x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth ~/.vnc/passwd -rfbport 5900 -shared" >>  /etc/init/x11vnc.conf
