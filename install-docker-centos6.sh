
# 基础环境为centos6.6
yum groupinstall "Development Libraries" "Development Tools"

#需要epel源
sudo yum install docker-io

# 修改docker启动参数, 设置阿里云的docker加速器
vi /etc/sysconfig/docker
other_args=" --registry-mirror=https://xxxxxxxx.mirror.aliyuncs.com"

# 开机启动
sudo chkconfig docker on

# 启动docker
sudo service docker start

# 查看是否启动成功
docker info


# 安装不同语言的镜像，如PHP
# https://github.com/iron-io/dockers
docker pull iron/php

docker run -it --rm iron/php php -v

# 以交互的方式进入alpine操作系统中
docker run -it iron/php /bin/sh
