#!/bin/bash

minikube start --vm-driver=virtualbox
minikube addons enable metallb

minikube dashboard & sleep 2 

eval "$(minikube docker-env)"

docker build -t service_nginx		srcs/nginx
docker build -t service_wordpress	srcs/wordpress
docker build -t service_mysql		srcs/mysql
docker build -t service_phpmyadmin	srcs/phpmyadmin
docker build -t service_ftps		srcs/ftps
docker build -t service_influxdb	srcs/influxdb
docker build -t service_grafana		srcs/grafana

kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/volumes.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/influxdb.yaml
kubectl apply -f srcs/grafana.yaml

