#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

mkdir -p $dir_path/logs

sudo docker stop fluent-bit

sudo docker rm fluent-bit

sudo docker run -d \
    --name fluent-bit \
    --restart unless-stopped \
    -v $dir_path/etc/fluent-bit.yaml:/fluent-bit/etc/fluent-bit.yaml \
    -v $dir_path/logs:/app/logs \
    fluent/fluent-bit:3.2.4 -c /fluent-bit/etc/fluent-bit.yaml

sudo docker logs -f fluent-bit
