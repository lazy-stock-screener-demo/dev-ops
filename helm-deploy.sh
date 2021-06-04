#!/usr/local/bin/bash
# GNU bash，版本 5.0.7(1)-release (x86_64-apple-darwin18.5.0)

releasePKGName=$2 && : ${releasePKGName:="lazy-stock-screener"}
helmValuePath=$3 && : ${helmValuePath:="./helm/values.prod.yaml"}

if [[ $1 == 'up' ]];then
    runInstall=$(helm install ${releasePKGName} --debug --values=${helmValuePath} ./helm)
    echo "${runInstall}"
fi

if [[ $1 == 'down' ]];then
    runUninstall=$(helm uninstall ${releasePKGName})
fi