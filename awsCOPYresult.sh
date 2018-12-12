#!/bin/bash


apple=($(cat ip.txt))
YEAR=`date +"%Y"`
TIME=`date +"%T"`
cd $HOME
DIR=$HOME/awesomeProject/Blockchaintest/outputs/$YEAR/$TIME
mkdir -p $DIR
i=0
while [ $i -lt ${#apple[@]} ]
do

scp -i cobuna_key.pem ubuntu@${apple[$i]}:~/.cobuna/result.txt $DIR/result$i.txt
ssh -i cobuna_key.pem ubuntu@${apple[$i]} "rm .cobuna/result.txt"
sleep 1

echo "Success$i"
((i++))
done



echo "**********COPY RESULT $1***************"






