#!/bin/bash

# 下载levedb1.7版本，1.7版本本人测试是通过的，最新版的levedb没有测试通过
wget https://github.com/google/leveldb/archive/v1.7.tar.gz
cd leveldb-1.7
make

# 安装PHP扩展
wget https://github.com/reeze/php-leveldb/archive/master.zip
cd php-leveldb-master
phpize
./configure --with-leveldb=/your_level_setup_path/leveldb-1.7 --with-php-config=/usr/bin/php-config
make
make install

vi /etc/php.ini
extension=leveldb.so
