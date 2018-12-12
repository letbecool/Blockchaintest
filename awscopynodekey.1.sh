#!/bin/bash


apple=($(cat ip.txt))
node=($(cat nodekey.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i cobuna_key.pem ubuntu@${apple[$i]} "echo "${node[$i]}" > .cobuna/geth/nodekey"
sleep 1

echo "Success$i"
((i++))
done


echo "**********COPY NODEKEY $1***************"




