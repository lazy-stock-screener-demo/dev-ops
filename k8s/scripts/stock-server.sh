#!/usr/local/bin/bash
# GNU bash，版本 5.0.7(1)-release (x86_64-apple-darwin18.5.0)

if [[ $1 == 'up' ]];then
    apply=$(kubectl apply \
        -f ../deployment/stock.server.deployment.yaml \
        -f ../dev/service/stock.server.service.yaml \
    )
    echo "${apply}"
fi

if [[ $1 == 'down' ]];then
    delete=$(kubectl delete \
        -f ../deployment/stock.server.deployment.yaml \
        -f ../dev/service/stock.server.service.yaml \
    )
    echo "${delete}"
fi