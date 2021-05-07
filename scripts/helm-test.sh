#!/bin/bash

kubectl config get-contexts          
helm lint pages 
helm template pages