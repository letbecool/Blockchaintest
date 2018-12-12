#!/bin/bash

if [ -z $1 ]
then
apple=($(cat ip.txt))
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


else
apple=($(cat ip2.txt))
array=($(ls keystore))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

scp -i titanaws.pem /home/bikeshrestha/awesomeProject/Blockchaintest/keystore/${array[$i]} ubuntu@${apple[$i]}:~/.cobuna/keystore
sleep 1

echo "Success$i"
((i++))
done
fi


echo "**********COPY KEYSTORE $1***************"

