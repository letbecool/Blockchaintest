#!/bin/bash

apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

#scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/nodes/node$((i+1))/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth
scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth


sleep 1


echo "Success$i"
((i++))
done


echo "**********COPY STATIC-NODES.JSON $1***************"





