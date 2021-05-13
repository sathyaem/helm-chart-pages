#!/bin/bash
set -e

echo Namespace = "$1"
echo RELEASE_NAME = "$2"
echo "----------------------Installing pages----------------------------------"


NAMESPACE=$1
RELEASE_NAME=$2
FOUND=kubectl get ns | grep -i -w -c "$NAMESPACE" 

echo "Did you find the namespace? - $FOUND"

if (( FOUND < 1 )); then
    kubectl create ns "$NAMESPACE"
fi

RELEASE_NAME="${NAMESPACE}"

helm upgrade --install "$RELEASE_NAME" pages -n "$NAMESPACE" --debug

echo "----------------------Completed Installation of  pages----------------------------------"