# Используем базовый образ
FROM openjdk:17-jdk-slim

# Указываем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем ваш JAR-файл в контейнер
COPY target/dockerLearning-0.0.1-SNAPSHOT.jar /app/dockerLearning-0.0.1-SNAPSHOT.jar

# Указываем команду для запуска приложения
CMD ["java", "-jar", "/app/my-app.jar"]