#! /bin/sh

#influxdb configuration

#launch deamon (influxdb in the backgroud)
influxd & sleep 5

# create database `telegraf` and user `telegraf` with password
# `|` makes the left output as the stdin for the right part
echo "create database telegraf" | influx
echo "create user telegraf with password 'pass'" | influx

mkdir etc/telegraf
mv telegraf.conf etc/telegraf

telegraf

tail -f /dev/null