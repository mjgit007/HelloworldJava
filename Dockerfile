FROM openjdk:8-jdk-alpine
WORKDIR /app
ARG JAR_FILE=target/*.jar
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]