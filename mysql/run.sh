#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker run -d \
    --name mysql_8_0 \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=rootpassword \
    -e MYSQL_USER=user \
    -e MYSQL_PASSWORD=password \
    -e MYSQL_ROOT_HOST='%' \
    --restart unless-stopped \
    -v $dir_path/data:/var/lib/mysql \
    mysql:8.0
