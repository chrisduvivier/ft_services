FROM alpine:3.13.1

RUN apk update && apk add \
    vsftpd \
    vim \
    openssl

COPY srcs/vsftpd.conf ./etc/vsftpd/
COPY srcs/start.sh ./

# Add permission
RUN chmod +x start.sh
RUN chmod +x ./etc/vsftpd/

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt \
#     -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=cduvivie/CN=ft_services"

EXPOSE 21 30021

CMD sh start.sh 