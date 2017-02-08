# Steps to get Grafana Running

## Grafana Server
* Install Ubuntu 16.04
* Run fix_eth0.sh (corrects name on ethernet adapter, will restart)
* Run install_x11vnc.sh (vnc acccess)
* Run install_grafana.sh (dashboard web gui that displays influxdb data)
* Run install_influxdb.sh (database for all data shown in dashboard)
* Run install_telegraf.sh (agent that sends data to influx)
* Setup user accounts in Grafana
* Import JSONs
