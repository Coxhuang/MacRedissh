#!/bin/sh 
case $1 in                                        
   start) su root /opt/redis/redis-start.sh start;;
   stop) su root /opt/redis/redis-stop.sh start;;
   *) echo "require start|stop" ;;     
esac
