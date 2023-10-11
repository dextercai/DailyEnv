#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker stop kartoza-geoserver
sudo docker rm kartoza-geoserver

sudo docker run -d \
        --name kartoza-geoserver \
        -v $dir_path/geoserver_data:/opt/geoserver_data \
        -p 8080:8080 \
        -e INSTALL_EXTENSIONS=true \
        -e SAMPLE_DATA=true \
        -e TOMCAT_PASSWORD=tomcat \
        -e GEOSERVER_ADMIN_PASSWORD=admin \
        -e STABLE_EXTENSIONS="mysql-plugin,charts-plugin,gwc-s3-plugin" \
        kartoza/geoserver
