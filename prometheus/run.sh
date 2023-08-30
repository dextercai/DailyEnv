#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker run -d \
    --name prometheus \
    --restart unless-stopped \
    --user root \
    -v $dir_path/stack-data:/opt/bitnami/prometheus/data \
    -v $dir_path/prometheus.yml:/opt/bitnami/prometheus/conf/prometheus.yml \
    -p 9090:9090 \
    bitnami/prometheus:latest