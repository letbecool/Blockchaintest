#!/bin/bash


if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi
DATADIR=/home/ubuntu/.cobuna
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'rm -rf $DATADIR/geth/chaindata $DATADIR/geth/lightchaindata $DATADIR/geth/nodes $DATADIR/geth/transactions.rlp $DATADIR/history $DATADIR/geth/LOCK $DATADIR/geth.ipc Blockchaintest/outputs'
sleep 1

echo "Success$i"
((i++))
done


echo "**********DELETE NODEINFO $1***************"





