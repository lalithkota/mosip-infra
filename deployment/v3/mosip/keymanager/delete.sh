#!/bin/sh
# Uninstalls Keymanager
NS=keymanager
while true; do
    read -p "Are you sure you want to delete Keymanager helm chart?(Y/n) " yn
    if [[ $yn == "Y" ]]
      then
        helm -n $NS delete keymanager
        helm -n $NS delete kernel-keygen
        break
      else
        break
    fi
done
