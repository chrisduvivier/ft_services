FROM alpine:3.13.1

RUN apk update && apk add \
    vim \
    php7 \
    php7-fpm \
    php7-mysqli \
    php7-mbstring\ 
    php7-json \
    php7-session \
    telegraf \
    openssl \
    nginx

RUN mkdir -p /usr/share/webapps/
RUN mkdir -p /run/nginx

# Unzip PhpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz \
    && tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz \
    && mv phpMyAdmin-5.0.4-all-languages phpmyadmin \
    && mv phpmyadmin /usr/share/webapps/ \
    && rm -rf /var/cache/apk/*

COPY ./config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php
COPY ./default.conf /etc/nginx/conf.d/
COPY ./start.sh  ./

#Create SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=cduvivie/CN=ft_services"

# Add permission
RUN chmod +x start.sh
# RUN chmod +x /usr/share/webapps/phpmyadmin

EXPOSE 5000

# CMD php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin/
# CMD nginx -g "daemon off;"

CMD ["/start.sh"]