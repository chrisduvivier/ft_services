FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	influxdb=1.8.3-r2 \
	telegraf

COPY /srcs/start.sh ./
COPY /srcs/telegraf.conf ./

# Add permission
RUN chmod +x start.sh

EXPOSE 8086

CMD ["/start.sh"]