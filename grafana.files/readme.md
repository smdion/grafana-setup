# Readme

## Definitions

* Telegraf - agent on computers to monitor
* Grafana - prettyness
* InfluxDB - database agents send stuff to
* influxdb.conf - configuration for database
* telegraf.conf - configuration for agent
* .json - pre-configured dashboards (NOTE: a lot of time you can download a .json and telegraf.conf)

## Install Process

1. Install Grafana/Influx on server
2. Install Telegraf on all severs your want to monitor
3. Set telegraf config (I took mine from the dashboards site)
4. If on Ubuntu 16.04, need to change ETH devices back to eth0 naming scheme

## Still ToDo
* Figure out autostart on telegraf agents
