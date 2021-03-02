#! /bin/sh

#influxdb configuration

#launch deamon (influxdb in the backgroud)
influxd & sleep 5

# create databases for exah services running, and set credential user:pass
# `|` makes the left output as the stdin for the right part
echo "create user user with password 'pass'" | influx
echo "create database influx_metrics_db" | influx
echo "create database nginx_metrics_db" | influx
echo "create database phpmyadmin_metrics_db" | influx
echo "create database wordpress_metrics_db" | influx
echo "create database mysql_metrics_db" | influx
echo "create database ftps_metrics_db" | influx
echo "create database grafana_metrics_db" | influx

#put config file 
mkdir etc/telegraf
mv telegraf.conf etc/telegraf

telegraf

tail -f /dev/null