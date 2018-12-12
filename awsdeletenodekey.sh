#!/bin/bash


apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'rm /home/ubuntu/cobuna/geth/nodekey'
sleep 1

echo "Success$i"
((i++))
done



echo "**********DELETE NODEKEY $1***************"





