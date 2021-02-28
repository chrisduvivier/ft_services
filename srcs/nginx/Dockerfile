FROM alpine:3.13.1

RUN apk update && apk add nginx \
    openssl \
    vim
 
RUN mkdir -p /run/nginx

COPY default.conf /etc/nginx/conf.d/

RUN mkdir -p /usr/share/nginx/html/

COPY index.html /usr/share/nginx/html/
COPY test.html /usr/share/nginx/html/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=cduvivie/CN=ft_services"

EXPOSE 80 443

CMD nginx -g "daemon off;"
# CMD tail -f /dev/null
