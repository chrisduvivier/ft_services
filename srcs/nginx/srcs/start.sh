#! /bin/sh

# start Telegraf
telegraf --config telegraf.conf &

# start NGINX (`deamon off` keeps the process running)
nginx -g "daemon off;"