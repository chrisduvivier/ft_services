FROM alpine:3.13.1

RUN apk update \
	&& apk add mariadb \
	&& apk add mariadb-client \
	&& apk add vim \
	&& rm -rf /var/cache/apk/*

COPY srcs/start.sh ./start.sh
COPY srcs/my.cnf /etc/
COPY srcs/mysql_setup.sql srcs/wordpress_setup.sql srcs/pma_ini.sql ./ 

# generate directory
RUN mkdir -p /run/mysqld

# Add permission
RUN chmod +x start.sh

EXPOSE 3306

CMD ["/start.sh"]
