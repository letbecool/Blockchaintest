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

scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/geth.sh ubuntu@${apple[$i]}:~
sleep 1

echo "Success$i"
((i++))
done

echo "**********COPY NODEKEY $1***************"




