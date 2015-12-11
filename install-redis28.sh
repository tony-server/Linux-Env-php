#!/bin/bash

cd /root/src
wget https://github.com/antirez/redis/archive/2.8.22.tar.gz
cd redis-2.8.22
make && make PREFIX=/usr/local/redis install
cp redis.conf /usr/local/redis/default.redis.conf

