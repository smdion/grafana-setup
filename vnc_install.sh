#!/bin/bash

echo "Please enter the VNC password followed by ENTER:"
read mypasswd

sudo apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal 
sudo apt-get -y install x11vnc
x11vnc -storepasswd $mypasswd /etc/x11vncpasswd

cat > /lib/systemd/system/x11vnc.service << EOF
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target
 
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -xkb -auth /var/run/lightdm/root/:0 -noxrecord -noxfixes -noxdamage -rfbauth /etc/x11vncpasswd -forever -bg -rfbport 5900 -o /var/log/x11vnc.log  > /dev/null 2>&1

 
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable x11vnc.service
systemctl start x11vnc.service
