#!/bin/bash

echo Namespace = "$1"
echo "----------------------Installing pages----------------------------------"


NAMESPACE=$1
RELEASE_NAME=string="${NAMESPACE}${pages}"

helm upgrade --install "$RELEASE_NAME" pages --create-namespace --debug

echo "----------------------Completed Installation of  pages----------------------------------"
