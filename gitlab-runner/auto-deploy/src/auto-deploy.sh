#!/bin/sh

set -x

function istio_update(){
    VERSION=1-8-0
    istioctl operator init
    kubectl get namespace "istio-system" || kubectl create ns "istio-system"
    kubectl apply -f - <<EOF
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  name: istiocontrolplane
  namespace: istio-system
spec:
  profile: default
  revision: ${VERSION}
  components:
    istiodRemote
      k8s:
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
        replicaCount: 1
      enabled: true
    proxy:
      enabled: false
    pilot:
      k8s:
        resources:
          requests:
            cpu: 100m
            memory: 1048Mi
        replicaCount: 1
      enabled: true
    # prometheus:
    #   - name: prometheus
    #     enabled: false
    ingressGateways:
      - name: istio-ingressgateway
        enabled: true
  meshConfig:
    enableAutoMtls: false
EOF
}

function preparation() {
    helm repo add gitlab https://charts.gitlab.io
}

function deploy() {
    local IMG_TAG_KEY_VALUE=$1
    kubectl get namespace "lazy-stock-screener" || kubectl create ns "lazy-stock-screener"
    helm upgrade --install lazy-stock-screener --debug --values="/helm-chart/values.prod.yaml" --set ${IMG_TAG_KEY_VALUE} /helm-chart
}

function tool_check(){
    helm -h
    istioctl -h
}

OPTIONS=$1
IMG_KEY_VALUE=$2

case $OPTIONS in
    install_istio) istio_update;;
    preparation) preparation ;;
    deploy) deploy $IMG_KEY_VALUE ;;
    check) tool_check ;;
    *) exit 1 ;;
esac