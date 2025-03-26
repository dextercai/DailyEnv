#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker rm -f bitnami_kafka_390

sudo docker run -d \
    --name=bitnami_kafka_390 \
    --user root \
    --restart unless-stopped \
    -p 9092:9092 \
    -p 9093:9093 \
    -e KAFKA_CFG_NODE_ID="kraft-cluster-id-2" \
    -e KAFKA_KRAFT_NODE_ID="kraft-cluster-id-2" \
    -e KAFKA_KRAFT_CLUSTER_ID="kraft-cluster-id-2" \
    -e KAFKA_CFG_PROCESS_ROLES=controller,broker \
    -e KAFKA_CFG_LISTENERS=PLAINTEXT://:9092,CONTROLLER://:9093 \
    -e KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT \
    -e KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@kafka:9093 \
    -e KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER \
    -v /etc/localtime:/etc/localtime \
    bitnami/kafka:3.9.0-debian-12-r13

sudo docker logs -f bitnami_kafka_390
