FROM java:8
MAINTAINER Test
ADD app.jar .
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]