#!/bin/bash


if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'free -m'
sleep 1

echo "Success$i"
((i++))
done

echo "**********FREE MEMPRY $1***************"



