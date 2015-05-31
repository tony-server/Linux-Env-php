#!/bin/bash
#
#这个yum源主要是对最新版的mysql进行yum支持
echo "=====start check yum ENV====="
if [ -d "/etc/yum.repos.d" ];then
	rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

	echo "=====makecache====="
	yum makecache

	echo "done....."	
else
	echo 'yum.repos.d no exist'
fi


#使用该源 需要指定参数 如以下
#yum install mysql55 mysql55-server  --enablerepo=webtatic-archive
#yum info mysql55 --enablerepo=webtatic-archive
#yum install php56w 搭载的模块查看https://webtatic.com/packages/php56/