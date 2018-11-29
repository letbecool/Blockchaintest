#!/bin/bash
#setting 5 nodes
./setupnodes.1.sh $1
#tps for transaction
TPS=$1
#count variable to exit while loop when 5
COUNT=0
sleep 5

PIN=`ps -ef | grep 'node app.js' | grep -v grep | awk '{print $2}'`
PIG=`ps -ef | grep geth | grep -v grep | awk '{print $2}'`


while [ -z $PIN ]
do 
COUNT=$((COUNT+1))
if [ ! -z $PIG ]
then
# grap and kill all pid running geth
ps -ef | grep geth | grep -v grep | awk '{print $2}' | xargs kill -9
fi
#increment of tps by 2
TPS=$((TPS+2))
./setupnodes.1.sh $TPS
sleep 60
#condition to exit loop
if [ $COUNT == 5 ]
then
break
fi
#get pid for running process
PIN=`ps -ef | grep 'node app.js' | grep -v grep | awk '{print $2}'`
PIG=`ps -ef | grep geth | grep -v grep | awk '{print $2}'`
done

