#!/usr/bin/env bash
docker rm -f db
docker rm -f clair
# docker run --rm -d --name db arminc/clair-db:$(date +%Y-%m-%d)
docker run --rm -d --name db arminc/clair-db:2019-05-22
sleep 5
docker run --rm -p 6060:6060 --link db:postgres -d --name clair arminc/clair-local-scan:v2.0.8_fe9b059d930314b54c78f75afe265955faf4fdc1
echo "local ip = "
ipconfig getifaddr en0