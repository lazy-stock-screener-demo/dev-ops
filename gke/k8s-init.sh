#!/usr/local/bin/bash
# GNU bash，版本 5.0.7(1)-release (x86_64-apple-darwin18.5.0)

# Create IP
export ADDRESS_NAME=lazy-stock-screener
export REGION=us-central1
gcloud compute addresses create $ADDRESS_NAME --region $REGION

# Update the IP with your reserved IP address
RESERVER_IP=gcloud compute addresses list | grep lazy-stock-screener | awk '{print $2}'
kubectl patch svc $INGRESSGATEWAY --namespace istio-system --patch '{"spec": { "loadBalancerIP": "$RESERVER_IP" }}'