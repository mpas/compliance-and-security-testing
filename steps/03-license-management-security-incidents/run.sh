#!/usr/bin/env bash
cd ../../sample-app/
./gradlew clean test generateLicenseReport dependencyCheckAnalyze
cd -