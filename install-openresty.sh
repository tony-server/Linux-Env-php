#!/bin/bash

# 安装依赖
yum install readline-devel pcre-devel openssl-devel gcc


# 添加模块
# ./configure --prefix=/usr/local/openresty --add-module=/root/src/FastDFS/fastdfs-nginx-module-master/src


./configure --prefix=/usr/local/openresty