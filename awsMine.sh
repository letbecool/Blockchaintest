#!/bin/bash
# accept 1 argument number of miner


apple=($(cat ip.txt))
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



