#!/bin/bash

apple=($(cat ip.txt))
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

