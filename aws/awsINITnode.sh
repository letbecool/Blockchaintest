#!/bin/bash



if [ -z $2 ]
then
apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth init ' $1
#ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth init genesis1miner.json'

echo "Success$i"
((i++))
done

else
apple=($(cat ip2.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i titanaws.pem ubuntu@${apple[$i]} 'geth init '$1

echo "Success$i"
((i++))
done
fi

echo "**********INIT COMPLETED $1***************"




