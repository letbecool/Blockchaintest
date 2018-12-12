#!/bin/bash


if [ -z $1 ]
then
apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth --datadir .cobuna attach --exec "web3.eth.blockNumber"'
sleep 1

echo "Success$i"
((i++))
done
else
apple=($(cat ip2.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i titanaws.pem ubuntu@${apple[$i]} 'geth --datadir .cobuna attach --exec "web3.eth.blockNumber"'
sleep 1

echo "Success$i"
((i++))
done
fi

echo "**********CHECKING BLOCKNUMBER $1***************"



