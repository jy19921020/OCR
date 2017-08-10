FROM java:8
#FROM localhost:5000/java-8
MAINTAINER Test
ADD app.jar .
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]