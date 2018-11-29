#!/bin/bash

# ./setupnodes.1.sh take one argument to pass to node app.js 
# argument is tps for network to measure data
#setting 5 nodes
./setupnodes.1.sh $1
#tps for transaction
TPS=$1
#count variable to exit while loop when 5
COUNT=0
COUNTEND=7
sleep 5

PIN=`ps -ef | grep 'node app.js' | grep -v grep | awk '{print $2}'`
PIG=`ps -ef | grep geth | grep -v grep | awk '{print $2}'`


while [ -z $PIN ]
do 
COUNT=$((COUNT+1))
#increment of tps by 2
TPS=$((TPS+2))
# grap and kill all pid running geth
ps -ef | grep geth | grep -v grep | awk '{print $2}' | xargs kill -9
sleep 5

./setupnodes.1.sh $TPS
sleep 10

#condition to exit loop
if [ $COUNT == $COUNTEND ]
then
ps -ef | grep geth | grep -v grep | awk '{print $2}' | xargs kill -9
break
fi

#get pid for running process
PIN=`ps -ef | grep 'node app.js' | grep -v grep | awk '{print $2}'`
PIG=`ps -ef | grep geth | grep -v grep | awk '{print $2}'`
done

