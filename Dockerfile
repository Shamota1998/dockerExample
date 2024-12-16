FROM maven:3.8.4-openjdk-17-slim AS build

# Устанавливаем рабочий каталог внутри контейнера
WORKDIR /app

# Копируем проект в контейнер
COPY . /app

# Выполняем сборку Maven
RUN mvn clean install

# Используем базовый образ
FROM openjdk:17-jdk-slim

# Указываем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем ваш JAR-файл в контейнер
COPY --from=build /app/target/dockerLearning-0.0.1-SNAPSHOT.jar /app/dockerLearning-0.0.1-SNAPSHOT.jar
#COPY target/dockerLearning-0.0.1-SNAPSHOT.jar /app/dockerLearning-0.0.1-SNAPSHOT.jar

EXPOSE 8080

# Указываем команду для запуска приложения
CMD ["java", "-jar", "/app/dockerLearning-0.0.1-SNAPSHOT.jar"]