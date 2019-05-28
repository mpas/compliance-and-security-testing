FROM openjdk:11-jdk-slim
RUN mkdir -p /app
COPY *.jar /app/application.jar
WORKDIR /app
ENTRYPOINT ["java","-Dmicronaut.server.port=8020", "-jar","application.jar"]