
#!/bin/bash
file_path=`readlink -f $0`
dir_path=`dirname $file_path`

sudo docker run -d \
    --name redis \
    -p 6379:6379 \
    --restart unless-stopped \
    -v $dir_path/data:/data \
    -v $dir_path/conf/redis.conf:/etc/redis/redis.conf \
    redis:bullseye redis-server /etc/redis/redis.conf --save 60 1 --loglevel warning
