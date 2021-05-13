#!/bin/bash
set -e

kubectl config get-contexts
kubectl create ns test
kubectl config set-context --current --namespace test       
helm lint pages 
helm template pages


helm upgrade --install api pages
echo '---------------------Started testing--------------'
kubectl logs contract-test
helm test api
echo '---------------------Completed testing------------'

helm uninstall api pages
kubectl delete ns test

