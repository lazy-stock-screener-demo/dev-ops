#!/usr/local/bin/bash
# GNU bash，版本 5.0.7(1)-release (x86_64-apple-darwin18.5.0)

if [[ $1 == 'up' ]];then
    apply=$(kubectl apply \
        -f ../statefulset/customer.postgre.sts.yaml \
        -f ../dev/service/customer.postgre.service.yaml \
    )
    echo "${apply}"
fi

if [[ $1 == 'down' ]];then
    delete=$(kubectl delete \
        -f ../statefulset/customer.postgre.sts.yaml \
        -f ../dev/service/customer.postgre.service.yaml \
    )
    kubectl delete pvc "$(kubectl get pvc -n lazy-stock-screener | grep customer | awk '{print$1}')" -n lazy-stock-screener
    echo "${delete}"
fi
# ../deployment/stock.server.deveployment.yaml \
# ../storage/stock.mongo.sts.yaml