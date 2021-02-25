FROM alpine:3.12.0

RUN apk update && apk add \
    vim \
    php7 \
    php7-fpm \
    php7-mysqli \
    php7-mbstring\ 
    php7-json \
    php7-session \
    # telegraf \
    openssl \
    nginx

#where wordpress will be put
RUN mkdir -p /usr/share/webapps/
RUN mkdir -p /run/nginx

COPY ./srcs/wordpress-5.6.1.tar.gz ./

# setup wordpress to appropriate folder
RUN tar -xzvf wordpress-5.6.1.tar.gz && \
    rm wordpress-5.6.1.tar.gz && \
    mv wordpress /usr/share/webapps/

#NGINX configuration file
COPY ./default.conf /etc/nginx/conf.d/
# Wordpress config file
COPY /srcs/wp-config.php /usr/share/webapps/wordpress
#Script to launch nginx service (daemon) and php 
COPY ./start.sh  ./

# Add permission
RUN chmod +x start.sh

#Create SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=cduvivie/CN=ft_services"

EXPOSE 5050

CMD ["./start.sh"]