#!/usr/bin/env bash
echo ""
echo "Building Docker Images"
echo "--------------------------------------------------------------------------------"
rm -rf ./docker-images/sample-app-image/*.jar
echo "Building Micronaut App"
cd sample-app
./gradlew clean assemble
cp build/libs/*.jar ../docker-images/sample-app-image/
cd -
echo ""
echo "Building Image"
echo "--------------------------------------------------------------------------------"
cd ./docker-images/sample-app-image/
bash build.sh
cd -