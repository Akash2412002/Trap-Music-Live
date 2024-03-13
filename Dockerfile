# Stage 1: Build the Maven project
FROM maven:3.8.4-openjdk-17 AS build

# Copy the entire project into the Docker build context
COPY . .

# Run Maven command to build the project
RUN mvn clean package -DskipTests

# Stage 2: Create the final image with the built JAR
FROM openjdk:17.0.1-jdk-slim

# Copy the built JAR file from the previous stage into the final image
COPY --from=build /target/Trap-Music-Live.jar /Trap-Music-Live.jar

# Expose the port that the application listens on
EXPOSE 8081

# Set the command to run the application when the container starts
ENTRYPOINT ["java", "-jar", "Trap-Music-Live.jar"]
