FROM alpine:3.13.1

RUN apk update && apk add \
	vim \
	grafana \
	telegraf

COPY /srcs/start.sh ./
COPY /srcs/telegraf.conf ./
COPY /srcs/provisioning/ /usr/share/grafana/conf/provisioning/
COPY /srcs/dashboards/ /var/lib/grafana/dashboards/

# Add permission
RUN chmod +x start.sh

EXPOSE 3000

CMD ["/start.sh"]