#!/bin/bash



apple=($(cat ip.txt))

cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
# while using nohup to kill process
#ssh -i cobuna_key.pem ubuntu@${apple[$i]} "pkill geth"
ssh -i cobuna_key.pem ubuntu@${apple[$i]} "screen -S Geth -X quit"

echo "Success$i"
((i++))
done



echo "**********KILLGETHPROCESS COMPLETED $1***************"




