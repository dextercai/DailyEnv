#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker run \
    --volume=/:/rootfs:ro \
    --volume=/var/run:/var/run:ro \
    --volume=/sys:/sys:ro \
    --volume=/var/lib/docker/:/var/lib/docker:ro \
    --volume=/dev/disk/:/dev/disk:ro \
    --publish=9101:8080 \
    --restart unless-stopped \
    --detach=true \
    --name=cadvisor \
    --privileged \
    --device=/dev/kmsg \
    drcai-docker.pkg.coding.net/dextercai_personal_simfly/docker/cadvisor