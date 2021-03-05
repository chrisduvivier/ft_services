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
kubectl apply -f ./srcs/nginx/nginx-deployment.yaml
kubectl apply -f ./srcs/mysql/mysql-deployment.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin-deployment.yaml
kubectl apply -f ./srcs/wordpress/wordpress-deployment.yaml
kubectl apply -f ./srcs/ftps/ftps-deployment.yaml
kubectl apply -f ./srcs/influxdb/influx-deployment.yaml
kubectl apply -f ./srcs/grafana/grafana-deployment.yaml

# have minikube expose the service locally
# minikube service nginx-service