#!/bin/bash

mkdir -p /mnt/wwwroot/gopro
mkdir -p /mnt/wwwroot/gopro/bin

cd /root/src
wget http://www.golangtc.com/static/go/go1.4.2/go1.4.2.linux-amd64.tar.gz
tar zxvf go1.4.2.linux-amd64.tar.gz
mv go /usr/local/go14

sed -i '$a \ ' /etc/profile
sed -i '$a export GOROOT=/usr/local/go14' /etc/profile
sed -i '$a export GOPATH=/mnt/wwwroot/gopro' /etc/profile
sed -i '$a export GOBIN=/mnt/wwwroot/gopro/bin' /etc/profile
sed -i '$a export PATH=$PATH:/usr/local/go14/bin' /etc/profile



