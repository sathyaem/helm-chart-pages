#!/bin/bash
set -e

echo Namespace = "$1"
NAMESPACE=$1
RELEASE_NAME=api


kubectl config get-contexts
kubectl create ns "$NAMESPACE"
kubectl config set-context --current --namespace "$NAMESPACE"      
helm lint pages 
helm template pages


helm upgrade --install "$RELEASE_NAME" pages --debug
# helm upgrade --install "$RELEASE_NAME" pages --create-namespace --debug
echo '---------------------Started testing--------------'
sleep 60s
helm test "$RELEASE_NAME" --logs
echo '---------------------Completed testing------------'

helm uninstall api
kubectl delete ns "$NAMESPACE"

