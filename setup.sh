#! /bin/sh

# Installation

# Setup Minikube
# minikube start
minikube start --vm-driver=docker

eval $(minikube -p minikube docker-env)

# build images from each Dockerfile
docker build ./srcs/nginx -t nginx_img
docker build ./srcs/mysql -t mysql_img
docker build ./srcs/phpmyadmin -t phpmyadmin_img
docker build ./srcs/wordpress -t wordpress_img
docker build ./srcs/ftps -t ftps_img
docker build ./srcs/influxdb -t influx_img
docker build ./srcs/grafana -t grafana_img

# metallb LoadBalancer config
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb-config.yaml

# create a deployment and a service in minikube from the nginx image
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/influxdb/influx.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml

# open minikuke dashboard
printf "Opening minikube Dashboard\n"
minikube dashboard