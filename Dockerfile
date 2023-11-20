FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
ARG EXTRACTED=./target/extracted
COPY ${EXTRACTED}/dependencies/ ./
COPY ${EXTRACTED}/spring-boot-loader/ ./
COPY ${EXTRACTED}/snapshot-dependencies/ ./
COPY ${EXTRACTED}/application/ ./
ENTRYPOINT ["java","org.springframework.boot.loader.JarLauncher"]
#FROM openjdk:8
#ADD ./target/student-kubernetes-demo-0.0.1-SNAPSHOT.jar student-kubernetes-demo-0.0.1-SNAPSHOT.jar
#ENTRYPOINT ["java","-jar","/student-kubernetes-demo-0.0.1-SNAPSHOT.jar"]