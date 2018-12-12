#!/bin/bash

apple=($(cat ip.txt))
DATADIR=nodes/node
cd $HOME
if [ $1 == 1 ]
then
i=0
while [ $i -lt ${#apple[@]} ]
do
#scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/nodes/node$((i+1))/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth
scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth
echo "Success$i"
((i++))
done

elif [ $1 == 2 ]
then
i=0
while [ $i -lt ${#apple[@]} ]
do
#scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/nodes/node$((i+1))/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth
scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/$DATADIR$i/static-nodes.json ubuntu@${apple[$i]}:~/.cobuna/geth
echo "Success$i"
((i++))
done

else
echo "please pass argument for all peered and 2 for different network configuration."

fi


echo "**********COPY STATIC-NODES.JSON $1***************"





