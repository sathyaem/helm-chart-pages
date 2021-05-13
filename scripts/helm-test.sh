#!/bin/bash
set -e

kubectl config get-contexts
kubectl create ns test
kubectl config set-context --current --namespace test       
helm lint pages 
helm template pages


helm upgrade --install api pages
echo '---------------------Started testing--------------'
sleep 60s
kubectl get pods
helm test api --logs
echo '---------------------Completed testing------------'

helm uninstall api pages --logs
kubectl delete ns test

