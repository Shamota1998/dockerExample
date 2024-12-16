# Add the base maven image in order to build a jar file
FROM maven:3.8.4-openjdk-17-slim AS build

# Working directory inside created container
WORKDIR /app

# Copy all the files in container's work directory
COPY . /app

# Perform mvn cln instl
RUN mvn clean install -DskipTests

# Base jdk image to be used in container
FROM openjdk:17-jdk-slim

# Working directory
WORKDIR /app

# Copy created jar file into newly created container
COPY --from=build /app/target/dockerLearning-0.0.1-SNAPSHOT.jar /app/dockerLearning-0.0.1-SNAPSHOT.jar
#COPY target/dockerLearning-0.0.1-SNAPSHOT.jar /app/dockerLearning-0.0.1-SNAPSHOT.jar

EXPOSE 8080

# Run command to start the application inside a container
CMD ["java", "-jar", "/app/dockerLearning-0.0.1-SNAPSHOT.jar"]