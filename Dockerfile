FROM openjdk:21
LABEL authors="tawfiq khnicha"

WORKDIR /app

COPY ./target/*-SNAPSHOT.jar /app/rest-api.jar

EXPOSE 8081:8081

ENTRYPOINT ["java", "-jar", "/app/rest-api.jar"]