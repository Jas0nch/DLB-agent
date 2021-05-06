#!/bin/bash

# ......ip
ip=`ip addr show eth0 | awk ' !/127.0.0.1/ && /inet/ { gsub(/\/.*/, "", $2); print ""$2 }'`
echo $ip
#ip_index=`echo $ip | awk -F '.' '{print $4}'`

#......cpu.........
#cpu=`top -b -n1 | fgrep "Cpu(s)" | tail -1 | awk -F'idle,' '{split($1, vs, ","); v=vs[length(vs)]; sub(/\s+/, "", v);sub(/\s+/, "", v); printf "%d", 100-v;}'`
cpu=`top -n1 | fgrep "CPU" | sed -n '1p' | awk -F 'idle' '{ split($1, vs, " "); v=vs[length(vs)];sub(/\s+/, "", v);sub(/\s+/, "", v); printf "%f", 100-v; }'`
#echo $cpu

nic=`top -n1 | fgrep "CPU" | sed -n '1p' | awk -F 'nic' '{ split($1, vs, " "); v=vs[length(vs)];sub(/\s+/, "", v);sub(/\s+/, "", v); printf "%f", v; }'`
#echo $nic

all=`echo $cpu $nic | awk '{print $1 - $2}'`
echo $all

#.....................
mem_used_persent=`free -m | awk -F '[ :]+' 'NR==2{printf "%f", ($2-$7)/$2*100}'`
echo $mem_used_persent

#echo '1'