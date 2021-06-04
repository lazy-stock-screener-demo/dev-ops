#!/usr/local/bin/bash
# GNU bash，版本 5.0.7(1)-release (x86_64-apple-darwin18.5.0)

currentPod=$1
targetPod=$2

k exec -t -i dnsutils -- nslookup