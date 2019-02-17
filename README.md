[TOC]


# Mac redis


## #0 GitHub 

```
https://github.com/Coxhuang/MacRedissh
```


## #1 环境

```
Mac
```


## #2 需求分析
- 配置redis后台启动脚本


## #3 开始

> 首先需要安装redis,可以正常启动reis

> 新建启动redis脚本 redis-start.sh


```
sudo vim /opt/redis/redis-start.sh
```

```
#!/bin/sh
cd /Users/cox/Documents/redis-5.0.3/src/ # redis的安装目录
./redis-server >  out.file  2>&1  & # ./redis-server是启动redis命令 后面后台启动
```

> 新建关闭redis脚本 


```
sudo vim /opt/redis/redis-stop.sh
```

```
#!/bin/sh
PROCESS=`ps -ef|grep redis|grep -v grep|grep -v PPID|awk '{ print $2}'`
for i in $PROCESS
do
  echo "Kill the $1 process [ $i ]"
  kill -9 $i
done
```

> 新建redis脚本


```
sudo vim /opt/redis/redis.sh
```

```
#!/bin/sh
case $1 in
   start) su root /opt/redis/redis-start.sh start;; # 启动redis
   stop) su root /opt/redis/redis-stop.sh start;; # 关闭redis
   *) echo "require start|stop" ;;
esac
```

## #3 使用

```
sudo sh redis.sh start # 启动redis
sudo sh redis.sh stop # 关闭redis
```







