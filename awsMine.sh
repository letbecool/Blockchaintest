#!/bin/bash
# accept 1 argument number of miner


if [ -z $2 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $2))
fi
cd $HOME

miner=$1
i=0
while [ $i -lt ${#apple[@]} ]
do

if [ $i -lt $miner ]
then
ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth --datadir .cobuna attach --exec "web3.miner.start()"'
echo "mining $i success"
fi

((i++))
done


echo "**********MINING $2***************"



