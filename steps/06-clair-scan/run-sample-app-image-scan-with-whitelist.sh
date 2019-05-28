#!/usr/bin/env bash
ip="$(ipconfig getifaddr en0)"
echo "Used ip=$ip"
cmd="./clair-scanner --ip $ip -w ./whitelist.yaml sample-app-image"
echo "running clair scan: $cmd"
eval $cmd