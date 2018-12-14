#!/bin/bash

# create instance in singapur
NUMBER=$2
REG=$1

if [ $1 == 1 ]
then
REGION=bikesh # singapor region

elif [ $1 == 2 ]
then
REGION=bikesh/stha # ohio region

else
echo "1 for singapur & 2 for ohio"
fi


if [ ! -f publicip.txt ] 
then
touch publicip.txt
fi

if [ ! -f instanceid.txt ] 
then
touch instanceid.txt
fi


if [ ! -z $2 ]
then
# for different ip addresss

echo "" >> publicip.txt
echo "" >> instanceid.txt
echo "$REGION" >> publicip.txt
echo "$REGION" >> instanceid.txt

i=0
while [ $i -lt $NUMBER ]
do
echo `curl --header "Content-Type: application/json" --request POST --data '{"nodeName":"Apple'$i'"}' https://an73tfmbmh.execute-api.ap-southeast-1.amazonaws.com/bikesh/$REGION` > instance.txt
echo `cat instance.txt | jq -r '.publicIp'` >> publicip.txt
echo `cat instance.txt | jq -r '.instanceId'` >> instanceid.txt
((i++)) 
done

echo "****************"
echo "please copy ip address from publicip.txt to ip.txt for further process."
echo "Dont forget to terminate the instance. Instanceid can be found in instanceid.txt"

echo "***************"
cat publicip.txt


else
echo "please enter number of instance you want to create"
fi


