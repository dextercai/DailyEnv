#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker run -d \
    --name=grafana \
    --user root \
    --restart unless-stopped \
    -p 3000:3000 \
    -v /etc/localtime:/etc/localtime \
    -v $dir_path/stack-data:/var/lib/grafana \
    grafana/grafana
