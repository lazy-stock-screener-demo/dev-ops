#!/usr/local/bin/bash
# GNU bash，版本 5.0.7(1)-release (x86_64-apple-darwin18.5.0)

if [[ $1 == 'up' ]];then
    apply=$(kubectl apply \
        -f ../statefulset/identity.redis.sts.yaml \
        -f ../dev/service/identity.redis.service.yaml \
    )
    echo "${apply}"
fi

if [[ $1 == 'down' ]];then
    delete=$(kubectl delete \
        -f ../statefulset/identity.redis.sts.yaml \
        -f ../dev/service/identity.redis.service.yaml \
    )
    kubectl delete pvc "$(kubectl get pvc -n lazy-stock-screener | grep identity | awk '{print$1}')" -n lazy-stock-screener
    echo "${delete}"
fi