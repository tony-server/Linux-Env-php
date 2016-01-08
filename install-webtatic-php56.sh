#!/bin/bash

#安装nginx 
# rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
yum install -y nginx 
 

#安装 php
yum -y install php56w php56w-opcache
yum -y install php56w-bcmath  php56w-cli php56w-common php56w-dba php56w-devel php56w-embedded php56w-enchant php56w-fpm php56w-gd php56w-imap php56w-intl php56w-ldap php56w-mbstring php56w-mcrypt  php56w-mysqlnd php56w-odbc php56w-pdo php56w-pear php56w-pecl-apcu php56w-pecl-gearman php56w-pecl-geoip php56w-pecl-imagick  php56w-pecl-memcache php56w-pecl-xdebug php56w-pgsql php56w-phpdbg php56w-process php56w-pspell php56w-recode  php56w-snmp  php56w-soapphp56w-tidy php56w-xml php56w-xmlrpc

