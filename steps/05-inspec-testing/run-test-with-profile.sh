#!/usr/bin/env bash
docker run -d --rm --name alpine-test alpine:latest tail -f /dev/null
inspec exec https://github.com/dev-sec/linux-baseline -t docker://alpine-test
docker rm -f alpine-test