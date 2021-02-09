#!/bin/sh

kubectl delete --all deployments
kubectl delete --all services
kubectl delete --all pods

# sleep 5
# docker image rm -f nginx_img