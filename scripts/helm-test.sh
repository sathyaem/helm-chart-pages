#!/bin/bash
set -e

echo Namespace = "$1"
NAMESPACE=$1
RELEASE_NAME="$2"


kubectl config get-contexts
kubectl create ns "$NAMESPACE"
kubectl config set-context --current --namespace "$NAMESPACE"      
helm lint pages 
helm template pages


start='date +%s'
helm upgrade --install "$RELEASE_NAME" pages --debug
end='date +%s'
runtime=$((end-start))
echo "------------------------Execution time was $runtime  seconds-------------------------"

# helm upgrade --install "$RELEASE_NAME" pages --create-namespace --debug
echo '---------------------Started testing--------------'
sleep 60s
helm test "$RELEASE_NAME" --logs
echo '---------------------Completed testing------------'

helm uninstall api
kubectl delete ns "$NAMESPACE"

