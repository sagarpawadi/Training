#!/bin/bash
#  We are using redis 4.2 in the setup below are the instructions to setup redis 
 redis (){

  sudo add-apt-repository ppa:chris-lea/redis-server
  apt-get update
  apt-get install redis-server
  cat redis.txt >> /etc/redis/redis.conf  # {copy from qa server and kept that on home }
  mkdir -p  /disk2/redis/data
  chown -R redis:redis /disk2/redis
  service redis-server restart
}
redis
redis-server --version
