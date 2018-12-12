#!/bin/bash

if [ -z $1 ]
then
apple=($(cat ip.txt))
YEAR=`date +"%Y"`
TIME=`date +"%T"`
cd $HOME
DIR=$HOME/awesomeProject/Blockchaintest/outputs/$YEAR/$TIME
mkdir -p $DIR
i=0
while [ $i -lt ${#apple[@]} ]
do

scp -i cobuna_key.pem ubuntu@${apple[$i]}:~/.cobuna/console.log $DIR/console$i.log
sleep 1

echo "Success$i"
((i++))
done



else
apple=($(cat ip2.txt))
YEAR=`date +"%Y"`
TIME=`date +"%T"`
cd $HOME
DIR=$HOME/awesomeProject/Blockchaintest/outputs/$YEAR/$TIME
mkdir -p $DIR
i=0
while [ $i -lt ${#apple[@]} ]
do

scp -i titanaws.pem ubuntu@${apple[$i]}:~/.cobuna/result.txt $DIR/restult$i.txt
sleep 1

echo "Success$i"
((i++))
done
fi


echo "**********COPY RESULT $1***************"






