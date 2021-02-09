# Installation

# Setup Minikube
# minikube start
minikube start --vm-driver=docker

eval $(minikube -p minikube docker-env)

# build an image that runs nginx
docker build ./srcs/nginx -t nginx_img

# create a deployment and a service in minikube from the nginx image
kubectl apply -f ./srcs/nginx/nginx-deployment.yaml
# kubectl apply -f ./srcs/mysql/mysql-deployment.yaml

# have minikube expose the service locally
minikube service nginx-service