#!/bin/bash
#generate enodeawslist.txt file 

if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi
ENODELIST=enodeawslist
nodekey=($(cat nodekey.txt))
echo -n "" > $ENODELIST$1
i=0
while [ $i -lt ${#apple[@]} ]
do
enodeid=`bootnode -nodekeyhex ${nodekey[$i]} -writeaddress`

echo -n "\"enode://$enodeid@${apple[$i]}" >> $ENODELIST$1
echo ":30303\"" >> $ENODELIST$1
echo "success $i"
((i++))
done


