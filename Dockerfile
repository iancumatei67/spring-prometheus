FROM maven:3.8.4-openjdk-17 AS build

WORKDIR /app

COPY pom.xml .

COPY src/ /app/src/
RUN mvn package

FROM openjdk AS final

WORKDIR /app

COPY --from=build /app/target/spring-petclinic*.jar /app/spring-petclinic.jar
COPY jmx_prometheus_javaagent-0.20.0.jar /app/
COPY config.yml /app/

EXPOSE 8080 12345

CMD ["java", "-javaagent:/app/jmx_prometheus_javaagent-0.20.0.jar=12345:/app/config.yml", "-jar", "spring-petclinic.jar"]
