#!/usr/bin/env bash
cd ../../sample-app/
./gradlew clean test jacocoTestReport sonar
cd -