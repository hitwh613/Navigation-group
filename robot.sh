#!/bin/bash
fun(){
  local map=$1
  eval "roslaunch robot robot.launch map:=$map" &
  sleep 60 &
  wait $!
}

while true
do
  read -p "Please input the choice:" map  #可改为从裁判系统获取地图信息 
  fun $map
  eval "rosnode kill -a"
done
