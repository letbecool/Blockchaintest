#!/bin/bash


apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
if [ !-d $DATADIR ]
then
ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'rm -rf .cobuna'
echo "Success$i"

else
echo "datadir is exist."
fi
((i++))
done



echo "**********DELETE NODEKEY $1***************"





