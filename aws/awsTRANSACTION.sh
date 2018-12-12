#!/bin/bash

if [ -z $1 ]
then
apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
    #if [ $i -lt 3 ]
   
    gnome-terminal --tab -- sh -c 'node '$HOME'/poatest/test/aapp.js '${apple[$i]}
  
echo "Success$i"    
((i++))
done

else
apple=($(cat ip2.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
    #if [ $i -lt 3 ]
   
    gnome-terminal --tab -- sh -c 'node '$HOME'/poatest/test/aapp.js '${apple[$i]}
  
echo "Success$i"    
((i++))
done
fi