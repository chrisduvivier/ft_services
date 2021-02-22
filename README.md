# ft_services

## General instructions
- [ ] You must put all the necessary files for the configuration of your server in a folder called `srcs`.
- [ ] Your `setup.sh` file should be at the root of your repository. This script will setup all your applications.

## Services to implement
- [ ] The Kubernetes web dashboard

- [ ] The Load Balancer which manages the external access of your services.
    - [x] It has to be the only entry point to the cluster. 
    - [ ] Keep the ports associated with the service (IP:3000 for Grafana etc). 
    - [x] Load Balancer will have a single ip.

- [ ] WordPress website
    - [x] listening on port 5050
    - [ ] work with a MySQL database.
    - [ ] Both services have to run in separate containers.
    - [ ] The WordPress website will have several users and an administrator.
    - [x] Wordpress needs its own nginx server.
    - [x] The Load Balancer should be able to redirect directly to this service.

- [ ] PhpMyAdmin
    - [x] listening on port 5000
    - [x] linked with the MySQL database.
    - [x] PhpMyAdmin needs its own nginx server. 
    - [x] The Load Balancer should be able to redirect directly to this service.
    - [ ] Issue: resolve deprecation notice

- [ ] Nginx server
    - [x] listening on ports 80 and 443. Port 80 will be in http and should be a systematic redirection of type 301 to 443, which will be in https.
    - [ ] The page displayed does not matter as long as it is not an http error.
    - [ ] This container will allow access to a /wordpress route that makes a redirect 307 to IP:WPPORT.
    - [x] It should also allow access to /phpmyadmin with a reverse proxy to IP:PMAPORT.

- [ ] FTPS server
    - [ ] listening on port 21

- [ ] A Grafana platform
    - [ ] listening on port 3000, linked with an InfluxDB database.
    - [ ] Grafana will be monitoring all your containers.
    - [ ] You must create one dashboard per service.
    - [ ] InfluxDB and grafana will be in two distincts containers.

- [ ] Persistent Volume
    - [x] data persist after stop of service/crash for MySQL.
    - [ ] data persist after stop of service/crash for InfluxDB.

- [ ] All your containers must restart in case of a crash or stop of one of its component parts.
- [ ] Make sure that each redirection toward a service is done using a load balancer.
- [ ] FTPS, Grafana, Wordpress, PhpMyAdmin and nginx’s kind must be "LoadBalancer".
- [ ] Influxdb and MySQL’s kind must be "ClusterIP".
- [ ] Other entries can be present, but none of them can be of kind "NodePort".

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
- Single IP entry point to the cluster: https://metallb.universe.tf/usage/#ip-address-sharing

## MySQL
- Used MariaDB
- Create User: https://linuxize.com/post/how-to-create-mysql-user-accounts-and-grant-privileges/#:~:text=A%20user%20account%20in%20MySQL,user_password%20with%20the%20user%20password

## PhPMyAdmin