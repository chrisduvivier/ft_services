#! /bin/sh

# start php-fpm7 for processing php requests (in the background)
php-fpm7  &

# start NGINX (`deamon off` keeps the process running)
nginx -g "daemon off;"