#!/bin/bash


if [ -z $1 ]
then
apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'echo "testing" > testing'

echo "Success$i"
((i++))
done


else
apple=($(cat ip2.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i titanaws.pem ubuntu@${apple[$i]} 'echo "testing" > testing'

echo "Success$i"
((i++))
done
fi


echo "**********CREATE PW FILE $1***************"


