# ---- Stage 1: Build the app ----
FROM maven:3.9.4-eclipse-temurin-17 as builder

# Set work directory
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the JAR (skip tests for faster builds)
RUN mvn clean package -DskipTests

# ---- Stage 2: Run the app ----
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the JAR from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose Spring Boot default port
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
