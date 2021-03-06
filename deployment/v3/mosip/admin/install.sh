#!/bin/sh
# Installs the Admin module
# Make sure you have updated ui_values.yaml
NS=admin

echo Create namespace
kubectl create ns $NS

echo Istio label 
kubectl label ns $NS istio-injection=enabled --overwrite
helm repo update

echo Copy configmaps
./copy_cm.sh

echo Installing admin service. Will wait till service gets installed.
helm -n $NS install admin-service mosip/admin-service --wait

ADMIN_HOST=`kubectl get cm global -o json | jq .data.\"mosip-api-internal-host\" | tr -d '"'`
echo Installing admin-ui
helm -n $NS install admin-ui mosip/admin-ui --set admin.hostUrl=https://$ADMIN_HOST/v1/

