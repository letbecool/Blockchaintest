#!/bin/bash
# ./setupnodesngerate.sh "genesis" tps
# ./setupnodes.1.sh take TWO argument to pass to node app.js 
# argument is tps for network to measure data
#setting 5 nodes
./setupnodes.1.sh $1 $2
#tps for transaction
TPS=$2
GENESIS=$1
#count variable to exit while loop when 5
COUNT=0
COUNTEND=4
sleep 5

PIN=`ps -ef | grep 'node app.js' | grep -v grep | awk '{print $2}'`
PIG=`ps -ef | grep geth | grep -v grep | awk '{print $2}'`


while [ -z $PIN ]
do 

#increment of tps by 2
TPS=$((TPS+4))
# grap and kill all pid running geth
ps -ef | grep geth | grep -v grep | awk '{print $2}' | xargs kill -9
sleep 5

./setupnodes.1.sh $GENESIS $TPS
sleep 10

#condition to exit loop
COUNT=$((COUNT+1))
if [ $COUNT == $COUNTEND ]
then
ps -ef | grep geth | grep -v grep | awk '{print $2}' | xargs kill -9
break
fi

#get pid for running process
PIN=`ps -ef | grep 'node app.js' | grep -v grep | awk '{print $2}'`
PIG=`ps -ef | grep geth | grep -v grep | awk '{print $2}'`
done

