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

ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'echo "testing" > password.txt'

echo "Success$i"
((i++))
done




echo "**********CREATE PW FILE $1***************"


