#!/usr/bin/env bash
rm -rf build
mkdir build
cp ../target/OCR_linkPage-*.jar app.jar
#通过docker build -t 指向dockerfile 并创建镜像 语法：docker build [OPTIONS] PATH | URL    PATH 是 . 即是当前目录
docker build -t OCR_linkPage .
rm -rf build