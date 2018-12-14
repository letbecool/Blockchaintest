#!/bin/bash

if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi
array=($(ls keystore))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/keystore/${array[$i]} ubuntu@${apple[$i]}:~/.cobuna/keystore
sleep 1

echo "Success$i"
((i++))
done



echo "**********COPY KEYSTORE $1***************"

