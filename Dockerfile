# ==========================
# Stage 1 - Build Stage
# ==========================
FROM eclipse-temurin:17-jdk AS builder

WORKDIR /app

# Copy Maven wrapper and project files
COPY . .

# Give execute permission to Maven Wrapper
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# ==========================
# Stage 2 - Runtime Stage
# ==========================
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy only the generated JAR from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Spring Boot default port
EXPOSE 8080

# Start the application
ENTRYPOINT ["java","-jar","app.jar"]
