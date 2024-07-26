FROM openjdk:11-jre-slim
WORKDIR /app
COPY . /app
RUN javac App.java
CMD ["java", "App"]
