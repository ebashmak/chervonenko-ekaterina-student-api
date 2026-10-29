FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

COPY build.gradle settings.gradle ./
COPY src ./src

# Скачиваем и устанавливаем Gradle (версии 8.5) 
RUN apt-get update && apt-get install -y wget unzip \
    && wget https://services.gradle.org/distributions/gradle-8.5-bin.zip \
    && unzip gradle-8.5-bin.zip \
    && mv gradle-8.5 /opt/gradle

# Добавляем gradle в системные переменные пути
ENV PATH="/opt/gradle/bin:${PATH}"

# Собираем проект
RUN gradle bootJar --no-daemon

# Финальный этап запуска
FROM eclipse-temurin:17-jre
WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
