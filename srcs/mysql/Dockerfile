FROM alpine:3.12.0

LABEL maintainer="cduvivie@student.s19.be"

RUN apk update && apk add \
	vim \
	mariadb \
	mariadb-client

COPY start.sh ./

EXPOSE 3306

CMD /start.sh