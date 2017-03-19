
# 下载BerkeleyDB安装包 http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/downloads/index.html
unzip db-6.2.23.zip

# 安装BerkeleyDB
cd db-6.2.23/build_unix
../dist/configure --prefix=/usr/local/berkeleydb --enable-cxx
make
make install

# 安装PHP扩展 到BerkeleyDB源码目录
cd lang/php_db4
phpize
./configure --with-db4=/usr/local/berkeleydb
make
make install
echo 'extension=db4.so' > /etc/php.d/db4.ini
