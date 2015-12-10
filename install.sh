#!/bin/bash

#挂载磁盘



#创建环境所需要的目录

#mkdir /mnt/wwwroot
#mkdir /mnt/data
#mkdir /mnt/log
#mkdir /mnt/svn

#检测与安装环境依赖
yum -y install vim*

yum install -y gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers gd gd2 gd-devel gd2-devel perl-CPAN pcre-devel
yum install -y libtool autoconf  automake libuuid-devel

#安装openresty


#安装php



#安装mysql



