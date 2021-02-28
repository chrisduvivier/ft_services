#!/bin/sh

kubectl delete --all deployments
kubectl delete --all services
kubectl delete --all pods

# to delete persistent volume
# kubectl delete pvc --all 

# sleep 5
# docker image rm -f nginx_img