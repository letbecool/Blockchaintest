#!/bin/bash



if [ -z $2 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $2))
fi
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth init ' $1
#ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth init genesis1miner.json'

echo "Success$i"
((i++))
done


echo "**********INIT COMPLETED $1***************"




