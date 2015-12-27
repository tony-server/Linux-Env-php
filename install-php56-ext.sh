#!/bin/bash

# 安装xhprof扩展
wget http://pecl.php.net/get/xhprof-0.9.4.tgz
tar zxvf xhprof-0.9.4.tgz
cd xhprof-0.9.4/extension/
/usr/local/php56/bin/phpize
./configure --enable-xhprof --with-php-config=/usr/local/php56/bin/php-config 
make && make install


