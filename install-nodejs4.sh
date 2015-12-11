#!/bin/bash

cd /root/src
wget https://nodejs.org/dist/v4.2.3/node-v4.2.3-linux-x64.tar.gz
tar zxvf node-v4.2.3-linux-x64.tar.gz
mv node-v4.2.3-linux-x64 /usr/local/nodejs42

sed -i '$a export PATH=$PATH:/usr/local/nodejs42/bin' /etc/profile


