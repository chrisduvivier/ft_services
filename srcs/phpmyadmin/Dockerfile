FROM alpine:3.12.0

RUN apk update && apk add \
    vim \
    php \
    php-fpm \
    php-mysqli \
    php-mbstring \ 
    php-json \
    php-session \
    nginx

# Download PhpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
    && tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
    && mv phpMyAdmin-4.9.0.1-all-languages /www \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /usr/share/webapps/
RUN mkdir -p /run/nginx

# COPY ./srcs/phpmyadmin /usr/share/webapps/phpmyadmin

# COPY ./srcs/config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php

EXPOSE 5000

# CMD php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin/
# CMD nginx -g "daemon off;"