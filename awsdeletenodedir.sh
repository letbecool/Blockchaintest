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
if [ !-d $DATADIR ]
then
ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'rm -rf .cobuna Blockchaintest/outputs'
echo "Success$i"

else
echo "datadir is exist."
fi
((i++))
done



echo "**********DELETE NODEKEY $1***************"





