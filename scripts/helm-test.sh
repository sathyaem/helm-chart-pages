#!/bin/bash
set -e

kubectl config get-contexts          
helm lint pages 
helm template pages