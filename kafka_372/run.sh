#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker rm -f kafka_372

sudo docker run -d \
    --name=kafka_372 \
    --user root \
    --restart unless-stopped \
    -p 9092:9092 \
    -p 9093:9093 \
    -v /etc/localtime:/etc/localtime \
    apache/kafka:3.7.2

sudo docker logs -f kafka_372
