FROM alpine:3.13.1

RUN apk update && apk add nginx \
    openssl \
    vim \
    telegraf
 
RUN mkdir -p /run/nginx
RUN mkdir -p /usr/share/nginx/html/

COPY srcs/default.conf /etc/nginx/conf.d/
COPY srcs/index.html /usr/share/nginx/html/
# telegraf
COPY srcs/start.sh ./
COPY srcs/telegraf.conf ./

# Add permission
RUN chmod +x start.sh

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=cduvivie/CN=ft_services"

EXPOSE 80 443

CMD ["/start.sh"]
