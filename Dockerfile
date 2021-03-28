FROM java:openjdk-8-jdk-alpine
VOLUME /tmp
ADD tmp/status.sh status.sh
RUN chmod +x status.sh

ADD target/*.jar app.jar

EXPOSE 8081
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]