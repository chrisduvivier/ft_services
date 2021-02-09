# ft_services

## getting into YAML configuration file
- starting from nginx.yaml and this documentation: https://kubernetes.io/docs/concepts/services-networking/service/#motivation

## setup LoadBalancer metalLB:
- https://kubernetes.github.io/ingress-nginx/deploy/baremetal/

## NGINX
- Open page on the exposed IP address
- SSL redirection
- You can only use `NodePort` by default when using custom K8 cluster (I was using LoadBalancer in nginx.yaml) https://stackoverflow.com/questions/44110876/kubernetes-service-external-ip-pending 