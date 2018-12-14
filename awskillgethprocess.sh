#!/bin/bash


if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
# while using nohup to kill process
#ssh -i cobuna_key.pem ubuntu@${apple[$i]} "pkill geth"
#ssh -i cobuna_key.pem ubuntu@${apple[$i]} "screen -S Geth -X quit"
ssh -i cobuna_key.pem ubuntu@${apple[$i]} "pkill screen"

echo "Success$i"
((i++))
done



echo "**********KILLGETHPROCESS COMPLETED $1***************"




