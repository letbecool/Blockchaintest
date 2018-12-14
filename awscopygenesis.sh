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
scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/genesis/$1 ubuntu@${apple[$i]}:~
#scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/genesis/genesis1miner.json ubuntu@${apple[$i]}:~

#gnome-terminal --tab -- sh -c 'ssh -i titanaws.pem ubuntu@'${apple[$i]}'; $SHELL'
echo "Success$i"
((i++))
done



echo "**********COPY GENESISFILE $1***************"



