#!/bin/bash
set -e

echo Namespace = "$1"
NAMESPACE=$1

helm upgrade --install "$RELEASE_NAME" pages --create-namespace --debug

kubectl config get-contexts
kubectl create ns "$NAMESPACE"
kubectl config set-context --current --namespace "$NAMESPACE"      
helm lint pages 
helm template pages


helm upgrade --install api pages
echo '---------------------Started testing--------------'
sleep 60s
helm test api --logs
echo '---------------------Completed testing------------'

helm uninstall api
kubectl delete ns "$NAMESPACE"

