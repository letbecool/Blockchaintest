#!/bin/bash
#generate enodeawslist.txt file 

nodekey=($(cat nodekey.txt))
apple=($(cat ip.txt))

echo -n "" > enodeawslist.txt
i=0
while [ $i -lt ${#apple[@]} ]
do
enodeid=`bootnode -nodekeyhex ${nodekey[$i]} -writeaddress`

echo -n "\"enode://$enodeid@${apple[$i]}" >> enodeawslist.txt
echo ":30303\"" >> enodeawslist.txt
echo "success $i"
((i++))
done


