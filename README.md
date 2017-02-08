# Steps to get Grafana Running
Note: Scripts were setup for Ubuntu 16.04

## Grafana Server
* Run fix_eth0.sh (corrects name on ethernet adapter, will restart)
* Run install_x11vnc.sh (vnc acccess)
* Run install_grafana.sh (dashboard web gui that displays influxdb data)
* Run install_influxdb.sh (database for all data shown in dashboard) 
* Run install_telegraf.sh (agent that sends data to influx) edit line 39 for influxdb ip
* Setup user accounts in Grafana
* Import JSONs

## Any Linux server you want to monitor
* Run install_x11vnc.sh (vnc access)
* Run install_telegraf.sh (agent that sends data to influx) edit line 39 for influxdb ip
* Import JSONs

## Pi-Hole monitoring
* Run install_monitor_pihole.sh (sets up python script and adds service)
* * May need to change IP for host
