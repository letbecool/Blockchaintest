#!/bin/bash


apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'rm -rf /home/ubuntu/.cobuna/geth/chaindata /home/ubuntu/.cobuna/geth/lightchaindata /home/ubuntu/.cobuna/geth/nodes /home/ubuntu/.cobuna/geth/transactions.rlp /home/ubuntu/.cobuna/history /home/ubuntu/.cobuna/geth/LOCK /home/ubuntu/.cobuna/geth.ipc'
sleep 1

echo "Success$i"
((i++))
done


echo "**********DELETE NODEINFO $1***************"





