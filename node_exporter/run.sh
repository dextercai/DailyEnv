#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker run -d \
    --restart unless-stopped \
    --name=node_exporter \
    -p 9100:9100 \
    -v /etc/localtime:/etc/localtime \
    -v /proc:/host/proc:ro \
    -v /sys:/host/sys:ro \
    -v /:/rootfs:ro \
    prom/node-exporter