#!/bin/bash

./configure --prefix=/usr/local/php56 \
--with-config-file-path=/usr/local/php56/etc \
--with-config-file-scan-dir=/usr/local/php56/etc/conf.d \
--enable-fpm \
--enable-mysqlnd \
--enable-pcntl \
--enable-opcache \
--enable-sockets \
--enable-sysvmsg \
--enable-sysvsem \
--enable-sysvshm \
--enable-shmop \
--enable-zip \
--enable-ftp \
--enable-soap \
--enable-xml \
--enable-mbstring \
--enable-gd-native-ttf \
--enable-gd-jis-conv \
--enable-dba \
--enable-calendar \
--enable-bcmath \
--enable-exif \
--enable-phpdbg \
--disable-rpath \
--disable-ipv6 \
--with-mysql=mysqlnd \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-pcre-regex \
--with-zlib \
--with-mcrypt \
--with-gd \
--with-mhash \
--with-xmlrpc \
--with-curl \
--with-imap-ssl \
--with-jpeg-dir \
--with-png-dir \
--with-freetype-dir \
--with-readline


make && make install
