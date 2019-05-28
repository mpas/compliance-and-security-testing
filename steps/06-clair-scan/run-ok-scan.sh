#!/usr/bin/env bash
docker pull alpine:3.5
ip="$(ipconfig getifaddr en0)"
echo "Used ip=$ip"
cmd="./clair-scanner --ip $ip alpine:3.5"
echo "running clair scan: $cmd"
eval $cmd