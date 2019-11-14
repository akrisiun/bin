#!/bin/zsh

docker ps -a  --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep -v k8s | awk {'printf("%-15s %s %3s %s %-32s %-20s %s %s\n",$1,$2,$3,$3,$4,$5,$6,$7,$8);'}
