
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn -B clean package

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /app/target/maven-github-1.0-SNAPSHOT.jar app.jar

CMD ["java", "-cp", "app.jar", "com.example.maven_github.GradeCalculator"]
