FROM alpine:3.12.0

RUN apk update && apk add mariadb \
    mariadb-client \
    vim

COPY mysql_setup.sql ./
COPY start.sh ./

# Add permission
RUN chmod +x start.sh

EXPOSE 90

CMD /start.sh