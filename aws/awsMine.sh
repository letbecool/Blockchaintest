#!/bin/bash


if [ -z $1 ]
then
apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
if [ $i == 0 ] || [ $i == 2 ] || [ $i == 3 ]
then
ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth --datadir .cobuna attach --exec "web3.miner.start()"'
sleep 1
fi
echo "Success$i"
((i++))
done
else
apple=($(cat ip2.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
if [ $i != 1 ]
then
ssh -i titanaws.pem ubuntu@${apple[$i]} 'geth --datadir .cobuna attach --exec "web3.miner.start()"'
sleep 1
fi
echo "Success$i"
((i++))
done
fi

echo "**********MINING $1***************"



