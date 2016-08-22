#!/bin/bash

# 安装依赖
yum install readline-devel pcre-devel openssl-devel gcc

./configure --prefix=/usr/local/openresty
