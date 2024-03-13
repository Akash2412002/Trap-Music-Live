FROM maven:3.8.4-openjdk-17 AS build

COPY . .  

RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim

COPY --from=build /target/Trap-Music-Live.jar Trap-Music-Live.jar

EXPOSE 8081

ENTRYPOINT [ "java","-jar", "Trap-Music-Live.jar" ]