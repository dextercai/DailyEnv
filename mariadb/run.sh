#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker run -d \
    --name mariadb \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=changeme \
    -e MARIADB_DATABASE=default_db \
    -e MARIADB_USER=user \
    -e MARIADB_PASSWORD=password \
    -e TZ='Asia/Shanghai' \
    -v $dir_path/stack:/var/lib/mysql:rw \
    --restart=unless-stopped \
    mariadb:11