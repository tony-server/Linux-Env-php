#dos2unix转换一下换行符

SRC_DIR=/root/src/
CURL_INSTALL_DIR=/usr/local/libcurl
phpversion=7.1.8
PHP_INSTALL_DIR=/usr/local/php71
LIB_MEMCACHED_INSTALL_DIR="/usr/local/"

#yum
yum -y install ca-certificates \
gcc gcc-c++ perl-CPAN m4 autoconf apr-util yum-utils \
gd libjpeg libtool libpng zlib gettext libevent net-snmp net-snmp-devel net-snmp-libs \
freetype libtool-tldl libxml2 unixODBC inotify-tools \
libxslt libmcrypt freetds ImageMagick jemalloc jemalloc-devel \
gd-devel libjpeg-devel libpng-devel zlib-devel \
freetype-devel libtool-ltdl libtool-ltdl-devel \
libxml2-devel zlib-devel bzip2-devel gettext-devel \
curl-devel gettext-devel libevent-devel \
libxslt-devel expat-devel unixODBC-devel \
openssl-devel libmcrypt-devel freetds-devel \
ImageMagick-devel pcre-devel openldap openldap-devel libc-client-devel

#curl
echo "+--------------------------------------------------+"
echo "|           install curl                           |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget -q -O curl-7.49.0.tar.gz https://curl.haxx.se/download/curl-7.49.0.tar.gz \
&& tar xzf curl-7.49.0.tar.gz \
&& cd curl-7.49.0 \
&& ./configure --prefix=${CURL_INSTALL_DIR} \
&& make 1>/dev/null \
&& make install

#libmemcached
echo "+--------------------------------------------------+"
echo "|           install libmemcached                   |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget -q -O libmemcached-1.0.18.tar.gz https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz \
&& tar xzf libmemcached-1.0.18.tar.gz \
&& cd libmemcached-1.0.18 \
&& ./configure --prefix=$LIB_MEMCACHED_INSTALL_DIR --with-memcached 1>/dev/null \
&& make 1>/dev/null \
&& make install

#PHP-7.1.8
echo "+--------------------------------------------------+"
echo "|           install PHP-7.1.8                      |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget -q -O php-${phpversion}.tar.gz http://cn2.php.net/distributions/php-${phpversion}.tar.gz \
&& tar xzf php-${phpversion}.tar.gz \
&& cd php-${phpversion} \
&& ./configure \
 --prefix=${PHP_INSTALL_DIR} \
 --with-config-file-path=${PHP_INSTALL_DIR}/etc \
 --with-config-file-scan-dir=${PHP_INSTALL_DIR}/etc/php.d \
 --sysconfdir=${PHP_INSTALL_DIR}/etc \
 --with-libdir=lib64 \
 --enable-mysqlnd \
 --enable-zip \
 --enable-exif \
 --enable-ftp \
 --enable-mbstring \
 --enable-mbregex \
 --enable-fpm \
 --enable-bcmath \
 --enable-pcntl \
 --enable-soap \
 --enable-sockets \
 --enable-shmop \
 --enable-sysvmsg \
 --enable-sysvsem \
 --enable-sysvshm \
 --enable-gd-native-ttf \
 --enable-wddx \
 --enable-opcache \
 --with-gettext \
 --with-xsl \
 --with-libexpat-dir \
 --with-xmlrpc \
 --with-snmp \
 --with-ldap \
 --enable-mysqlnd \
 --with-mysqli=mysqlnd \
 --with-pdo-mysql=mysqlnd \
 --with-pdo-odbc=unixODBC,/usr \
 --with-gd \
 --with-jpeg-dir \
 --with-png-dir \
 --with-zlib-dir \
 --with-freetype-dir \
 --with-zlib \
 --with-bz2 \
 --with-openssl \
 --with-curl=${CURL_INSTALL_DIR} \
 --with-mcrypt \
 --with-mhash \
 --without-pear \
&& make \
&& make install

#成功编译安装完成后，再安装pear
# ln -s /usr/local/php71/bin/php /usr/bin/php
# wget  http://pear.php.net/go-pear.phar 
# php go-pear.phar




#php-yaml
echo "+--------------------------------------------------+"
echo "|           install php-yaml                       |"
echo "+--------------------------------------------------+"
cd $SRC_DIR \
&& wget -O yaml-0.1.5.tar.gz http://pyyaml.org/download/libyaml/yaml-0.1.5.tar.gz \
&& tar xzf yaml-0.1.5.tar.gz \
&& cd yaml-0.1.5 \
&& ./configure --prefix=/usr/local \
&& make >/dev/null \
&& make install \
&& cd $SRC_DIR \
&& wget --http-user=pinguo-ops --http-passwd=iR0n6O3lNk5YtO3vH7Cd http://ops-packages.camera360.com/soft/yaml-2.0.0.tgz \
&& tar xzf yaml-2.0.0.tgz \
&& cd yaml-2.0.0 \
&& $PHP_INSTALL_DIR/bin/phpize \
&& ./configure --with-yaml=/usr/local --with-php-config=$PHP_INSTALL_DIR/bin/php-config \
&& make >/dev/null \
&& make install

#php-mongodb
echo "+--------------------------------------------------+"
echo "|           install php-mongodb                    |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget http://pecl.php.net/get/mongodb-1.2.8.tgz \
&& tar zxvf mongodb-1.2.8.tgz \
&& cd mongodb-1.2.8 \
&& ${PHP_INSTALL_DIR}/bin/phpize \
&& ./configure --with-php-config=$PHP_INSTALL_DIR/bin/php-config 1>/dev/null \
&& make clean \
&& make -j \
&& make install

#php-redis
echo "+--------------------------------------------------+"
echo "|           install php-redis                      |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget http://pecl.php.net/get/redis-3.1.2.tgz \
&& tar zxvf redis-3.1.2.tgz \
&& cd redis-3.1.2 \
&& ${PHP_INSTALL_DIR}/bin/phpize \
&& ./configure --with-php-config=$PHP_INSTALL_DIR/bin/php-config 1>/dev/null \
&& make clean \
&& make 1>/dev/null \
&& make install \
&& echo 'extension=redis.so'>$PHP_INSTALL_DIR/etc/php.d/redis.ini

#php-imagick
echo "+--------------------------------------------------+"
echo "|           install php-imagick                    |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget http://pecl.php.net/get/imagick-3.4.3.tgz \
&& tar zxvf imagick-3.4.3.tgz \
&& cd imagick-3.4.3 \
&& ${PHP_INSTALL_DIR}/bin/phpize \
&& ./configure --with-php-config=$PHP_INSTALL_DIR/bin/php-config 1>/dev/null \
&& make clean \
&& make 1>/dev/null \
&& make install

#php-xdebug
echo "+--------------------------------------------------+"
echo "|           install php-xdebug                     |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget http://pecl.php.net/get/xdebug-2.5.3.tgz \
&& tar zxvf xdebug-2.5.3.tgz \
&& cd xdebug-2.5.3 \
&& ${PHP_INSTALL_DIR}/bin/phpize \
&& ./configure --with-php-config=$PHP_INSTALL_DIR/bin/php-config 1>/dev/null \
&& make clean \
&& make 1>/dev/null \
&& make install

#php-igbinary
echo "+--------------------------------------------------+"
echo "|           install php-igbinary                   |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget http://pecl.php.net/get/igbinary-2.0.1.tgz \
&& tar zxvf igbinary-2.0.1.tgz \
&& cd igbinary-2.0.1 \
&& ${PHP_INSTALL_DIR}/bin/phpize \
&& ./configure --with-php-config=$PHP_INSTALL_DIR/bin/php-config 1>/dev/null \
&& make clean \
&& make 1>/dev/null \
&& make install

#php-memcached
echo "+--------------------------------------------------+"
echo "|           install php-memcached                  |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget http://pecl.php.net/get/memcached-3.0.3.tgz \
&& tar xzf memcached-3.0.3.tgz \
&& cd memcached-3.0.3 \
&& ${PHP_INSTALL_DIR}/bin/phpize \
&& ./configure --enable-memcached --with-php-config=$PHP_INSTALL_DIR/bin/php-config \
 --with-libmemcached-dir=$LIB_MEMCACHED_INSTALL_DIR --disable-memcached-sasl 1>/dev/null \
&& make 1>/dev/null \
&& make install

#php-yac
echo "+--------------------------------------------------+"
echo "|           install php-yac                        |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget https://github.com/laruence/yac/archive/yac-2.0.2.tar.gz \
&& tar zxvf yac-2.0.2.tar.gz \
&& cd yac-yac-2.0.2 \
&& ${PHP_INSTALL_DIR}/bin/phpize \
&& ./configure --with-php-config=${PHP_INSTALL_DIR}/bin/php-config \
&& make 1>/dev/null \
&& make install

#phpunit
echo "+--------------------------------------------------+"
echo "|           install phpunit                        |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget -O phpunit.phar https://phar.phpunit.de/phpunit.phar \
&& mv phpunit.phar ${PHP_INSTALL_DIR}/bin/phpunit \
&& chmod +x ${PHP_INSTALL_DIR}/bin/phpunit

#composer
echo "+--------------------------------------------------+"
echo "|           install composer                       |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& curl -sS https://getcomposer.org/installer | $PHP_INSTALL_DIR/bin/php \
&& chmod +x composer.phar \
&& mv composer.phar ${PHP_INSTALL_DIR}/bin/composer

#hiredis
echo "+--------------------------------------------------+"
echo "|           install hiredis                        |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget -O hiredis-0.13.3.tar.gz https://github.com/redis/hiredis/archive/v0.13.3.tar.gz \
&& tar zxvf hiredis-0.13.3.tar.gz \
&& cd hiredis-0.13.3 \
&& make -j \
&& make install \
&& echo "/usr/local/lib" > /etc/ld.so.conf.d/local.conf \
&& ldconfig


#php-swoole
echo "+--------------------------------------------------+"
echo "|           install php-swoole                     |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget -q -O swoole-1.9.18.tar.gz https://github.com/swoole/swoole-src/archive/v1.9.18.tar.gz \
&& tar zxvf swoole-1.9.18.tar.gz \
&& cd swoole-src-1.9.18/ \
&& ${PHP_INSTALL_DIR}/bin/phpize \
&& ./configure --with-php-config=$PHP_INSTALL_DIR/bin/php-config --enable-async-redis --enable-openssl \
&& make clean 1>/dev/null \
&& make 1>/dev/null \
&& make install

#php-inotify
echo "+--------------------------------------------------+"
echo "|           install php-inotify                    |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget http://pecl.php.net/get/inotify-2.0.0.tgz \
&& tar zxvf inotify-2.0.0.tgz \
&& cd inotify-2.0.0 \
&& ${PHP_INSTALL_DIR}/bin/phpize \
&& ./configure --with-php-config=$PHP_INSTALL_DIR/bin/php-config 1>/dev/null \
&& make clean \
&& make 1>/dev/null \
&& make install

#jq
echo "+--------------------------------------------------+"
echo "|           install jq                             |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 \
&& mkdir -p /home/worker/bin \
&& mv jq-linux64 ${HOME}/bin/jq \
&& chmod +x ${HOME}/bin/jq

#git
echo "+--------------------------------------------------+"
echo "|           install git                            |"
echo "+--------------------------------------------------+"
cd ${SRC_DIR} \
&& mkdir -p ${SRC_DIR} \
&& yum -y remove git \
&& wget https://www.kernel.org/pub/software/scm/git/git-2.13.0.tar.gz \
&& tar zxvf git-2.13.0.tar.gz \
&& cd git-2.13.0 \
&& make configure \
&& ./configure --prefix=/usr/local/ --with-curl=${CURL_INSTALL_DIR} \
&& make -j \
&& make install






echo "+--------------------------------------------------+"
echo "| curl|libmemcached|PHP|php-yaml|php-mongodb       |"
echo "| php-redis|php-imagick|php-xdebug|php-igbinary    |"
echo "| php-memcached|php-yac|phpunit|composer           |"
echo "| hiredis|php-swoole|php-inotify|jq|git            |"
echo "|           install completed                      |"
echo "+--------------------------------------------------+"


