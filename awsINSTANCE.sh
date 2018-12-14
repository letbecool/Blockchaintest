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
    #if [ $i -lt 3 ]
   
    gnome-terminal --tab -- sh -c 'ssh -i cobuna_key.pem ubuntu@'${apple[$i]}'; $SHELL'
  
echo "Success$i"    
((i++))
done
