#!/bin/bash

echo "Please enter the VNC password followed by ENTER:"
read mypasswd

sudo apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal 
sudo apt-get -y install x11vnc
/usr/bin/x11vnc -storepasswd $mypasswd /etc/x11vncpasswd

sudo cat > /lib/systemd/system/x11vnc.service << EOF
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target
 
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /etc/x11vncpasswd -rfbport 5900 -shared

 
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable x11vnc.service
sudo systemctl start x11vnc.service
