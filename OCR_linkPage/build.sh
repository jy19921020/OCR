#!/bin/bash

source /etc/profile

MYIMAGE=127.0.0.1:8800/springboot/OCR_linkPage

# 如果需要push，就取消注释
docker login 127.0.0.1:8800 -u 1063575596@qq.com -p xiao19921020

# 暂停所有容器
docker kill $(docker ps -aq)

# 删除所有容器
docker rm $(docker ps -aq)

# 删除所有旧的镜像
docker images | grep 127.0.0.1:8800/springboot/OCR_linkPage | awk '{print $3}' | xargs docker rmi

# 构建jar包和镜像
mvn package -e -X docker:build -DskipTest

# 运行容器
docker run -dp 8888:8800 --name OCR_linkPage ${MYIMAGE}

# push image
docker push ${MYIMAGE}






