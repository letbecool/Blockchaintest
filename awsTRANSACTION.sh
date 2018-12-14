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
    if [ $i == 1 ]
    then
    gnome-terminal --tab -- sh -c 'node '$HOME'/poatest/test/aapp.js '${apple[$i]}
    fi
echo "Success$i"    
((i++))
done

