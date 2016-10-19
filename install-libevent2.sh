#!/bin/bash

wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable

./configure --prefix=/usr/local/libevent2
make && make install


#配置 CENTOS6
cd /etc/ld.so.conf.d
echo "/usr/local/libevent2/lib" > libevent2.conf
ldconfig



#测试代码 event.c

:<<!

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>

#include "event.h"



struct event ev;
struct timeval tv;

void time_cb(int fd,short event,void *argc)
{
    printf("timer wakeup\n");
    event_add(&ev,&tv);
}


int main()
{
    struct event_base *base =(struct event_base*)event_init();

    tv.tv_sec = 10;
    tv.tv_usec = 0;
    evtimer_set(&ev,time_cb,NULL);
    event_add(&ev,&tv);
    event_base_dispatch(base);
    return 0;
}

!

# 编译命令
# gcc -o event event.c -I /usr/local/libevent2/include/ -L /usr/local/libevent2/lib/ -levent
# 执行 ./event 每10秒输出一个 timer wakeup
