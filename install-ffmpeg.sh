# 下载源码
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg

# 安装依赖
yum install yasm


cd ffmpeg

./configure --enable-shared --prefix=/usr/local/ffmpeg

make -j4

make install

# 修改文件/etc/ld.so.conf 内容增加/usr/local/ffmpeg/lib/
# 使修改生效 ldconfig


# 检查是否安装成功
/usr/local/ffmpeg/bin/ffmpeg -version

# 配置环境变量 path
export PATH=/usr/local/ffmpeg/bin/:$PATH
