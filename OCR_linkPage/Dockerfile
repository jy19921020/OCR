FROM ubuntu:latest  #拉取一个nginx镜像。
MAINTAINER kim  #MAINTAINER（用来指定镜像创建者信息）

#安装JDK
RUN apt-get update
RUN apt-get install -y openjdk-7-jdk && apt-get install -y wget
#安装maven
RUN mkdir /var/tmp/maven
RUN wget -P /var/tmp/maven http://mirrors.cnnic.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN tar xzf /var/tmp/maven/apache-maven-3.3.9-bin.tar.gz -C /var/tmp/maven
RUN rm -rf /var/tmp/maven/apache-maven-3.3.9-bin.tar.gz
#设置maven环境变量
ENV MAVEN_HOME=/var/tmp/maven/apache-maven-3.3.9
ENV PATH=$MAVEN_HOME/bin:$PATH

#打包示例项目并拷贝到tomcat webapps目录
RUN mkdir /var/tmp/webapp
ADD ./ /var/tmp/webapp
RUN cd /var/tmp/webapp && mvn package && cp /var/tmp/webapp/target/OCR_linkPage-0.0.1-SNAPSHOT.jar /var/tmp

EXPOSE 8080

CMD ["./var/tmp/","java -jar OCR_linkPage-0.0.1-SNAPSHOT.jar"]
#VOLUME /tmp
#COPY target/bip.jar /opt/
#EXPOSE 80
#RUN sh -c 'touch /opt/bip.jar'
#ENV JAVA_OPTS=""
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /opt/bip.jar" ]