#!/usr/bin/env bash
docker run -d \
-p 8888:8888 \
--name OCR_linkPage \
-e spring.profiles.active="test" \
-e server.port=8888 \
OCR