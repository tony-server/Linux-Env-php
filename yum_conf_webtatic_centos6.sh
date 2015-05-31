#!/bin/bash
echo "=====start check yum ENV====="
if [ -d "/etc/yum.repos.d" ];then
	rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

	echo "=====makecache====="
	yum makecache

	echo "done....."	
else
	echo 'yum.repos.d no exist'
fi





