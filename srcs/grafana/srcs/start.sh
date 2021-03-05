#! /bin/sh

telegraf --config telegraf.conf &

# run grafana
grafana-server -config /usr/share/grafana/conf/defaults.ini -homepath /usr/share/grafana/