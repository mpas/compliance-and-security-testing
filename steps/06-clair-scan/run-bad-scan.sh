#!/usr/bin/env bash
docker pull imiell/bad-dockerfile
ip="$(ipconfig getifaddr en0)"
echo "Used ip=$ip"
cmd="./clair-scanner --ip $ip imiell/bad-dockerfile"
echo "running clair scan: $cmd"
eval $cmd