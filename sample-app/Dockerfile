FROM openjdk:11-jdk-slim as build-env
RUN mkdir -p /app
WORKDIR /app
COPY . ./
RUN ls -alg
RUN ./gradlew clean assemble -i
RUN ls -alg