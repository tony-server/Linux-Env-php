
# 对服务器的一些设置
setenforce 0 #关闭SELinux; shell>sestatus -v


# add gourp and user for zabbix
# 如果server和agent运行在同一台主机上，请用不同用户分别运行它们
groupadd zabbix
useradd -g zabbix zabbix

# 需要数据库环境 这里用MYSQL
# mysql -uroot -proot
# mysql> create database zabbix default charset utf8; //不设置utf8 有可能会导致你出现中文乱码问题
# mysql> grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix的密码'; //建立账号并赋给权限
# mysql> quit;
# shell> mysql -uzabbix -p<password> zabbix < database/mysql/schema.sql
# 如果不是server 仅仅是Zabbix proxy，不用导入下面两个sql
# shell> mysql -uzabbix -p<password> zabbix < database/mysql/images.sql
# shell> mysql -uzabbix -p<password> zabbix < database/mysql/data.sql


# 如果使用yum安装sql文件在这里 cd /usr/share/doc/zabbix-server-mysql-2.4.7/create

#===========采用yum安装==============================================================================================================================

rpm -ivh http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm
# 安装server
yum install zabbix-server-mysql zabbix-web-mysql
# 仅仅安装agent
yum install zabbix-agent


# 编辑配置文件 vi /etc/zabbix/zabbix_server.conf
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=zabbix

# 启动
service zabbix-server start


# 修改zabbix所需的PHP配置
# 默认web所在目录/usr/share/zabbix 同时配置nginx的web目录
vim /etc/php-fpm.d/www.conf
# 后面添加
php_value[max_execution_time] = 300
php_value[memory_limit] = 128M
php_value[post_max_size] = 16M
php_value[upload_max_filesize] = 20M
php_value[max_input_time] = 300
php_value[date.timezone] = Asia/Shanghai
php_value[always_populate_raw_post_data] = -1


# 重启nginx php
# 默认用户/密码为 Admin/zabbix




#===========使用源代码编译安装=======在percona下安装有些问题 暂时未解决=======================================================================================
# 下载zabbix源代码 包含server、agent、proxy等全部组件
wget http://netix.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/2.4.7/zabbix-2.4.7.tar.gz

# 安装server
cd src/zabbix-2.4.7
./configure --prefix=/usr/local/zabbix24 --enable-server --enable-agent --with-mysql --enable-ipv6 --with-net-snmp --with-libcurl --with-libxml2



# 安装agent
cd src/zabbix-2.4.7
./configure --prefix=/usr/local/zabbix24 --enable-agent
