#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker rm -f kafka_390

sudo docker run -d \
    --name=kafka_390 \
    --user root \
    --restart unless-stopped \
    -p 9092:9092 \
    -e KAFKA_LOG_DIRS=/var/lib/kafka/data/ \
    -e KAFKA_PROCESS_ROLES="controller,broker" \
    -e KAFKA_NODE_ID=1 \
    -e KAFKA_CONTROLLER_QUORUM_VOTERS=1@localhost:9093 \
    -e KAFKA_LISTENERS=PLAINTEXT://:9092,CONTROLLER://:9093 \
    -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092,CONTROLLER://localhost:9093 \
    -e KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,CONTROLLER:PLAINTEXT \
    -e KAFKA_INTER_BROKER_LISTENER_NAME=PLAINTEXT \
    -e KAFKA_AUTO_CREATE_TOPICS_ENABLE=true \
    -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
    -e KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1 \
    -e KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=1 \
    -e KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS=0 \
    -e KAFKA_CONTROLLER_LISTENER_NAMES=CONTROLLER \
    -p 9093:9093 \
    -v /etc/localtime:/etc/localtime \
    -v $dir_path/data:/var/lib/kafka/data \
    apache/kafka:3.9.0

sudo docker logs -f kafka_390
