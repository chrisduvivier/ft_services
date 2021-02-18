# ft_services

## Minikube
- How pods communicate (how each services will communicate): https://matthewpalmer.net/kubernetes-app-developer/articles/kubernetes-networking-guide-beginners.html#:~:text=Communication%20between%20pods%20and%20services,-One%20last%20communication&text=In%20Kubernetes%2C%20a%20service%20lets,Kubernetes%20runs%20inside%20every%20node.

- CrashBackLoop? Keep the pod alive: https://stackoverflow.com/questions/31870222/how-can-i-keep-a-container-running-on-kubernetes

## getting into YAML configuration file
- starting from nginx.yaml and this documentation: https://kubernetes.io/docs/concepts/services-networking/service/#motivation

## setup LoadBalancer metalLB:
- https://kubernetes.github.io/ingress-nginx/deploy/baremetal/

## NGINX
- Open page on the exposed IP address
- SSL redirection
- You can only use `NodePort` by default when using custom K8 cluster (I was using LoadBalancer in nginx.yaml) https://stackoverflow.com/questions/44110876/kubernetes-service-external-ip-pending

## METALLB
- https://medium.com/faun/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df

## MySQL
- Used MariaDB
- 

## PhPMyAdmin