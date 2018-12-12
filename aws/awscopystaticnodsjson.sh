#!/bin/bash

if [ -z $1 ]
then
apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

#scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/nodes/node$((i+1))/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth
scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/nodes/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth


sleep 1


echo "Success$i"
((i++))
done


else
apple=($(cat ip2.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

#scp -i titanaws.pem /home/bikeshrestha/awesomeProject/Blockchaintest/nodes/node$((i+1))/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth
#for all peer with each other 
scp -i titanaws.pem /home/bikeshrestha/awesomeProject/Blockchaintest/nodes/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth

sleep 1


echo "Success$i"
((i++))
done
fi

echo "**********COPY STATIC-NODES.JSON $1***************"





