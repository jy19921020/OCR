FROM java
VOLUME /tmp
ADD OCR_linkPage-1.0.1-SNAPSHOT.jar app.jar
RUN bash -c 'touch /app.jar'
EXPOSE 6666
ENTRYPOINT ["java","-jar","/app.jar"]
