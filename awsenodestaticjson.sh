#!/bin/bash
# must pass ip as a argument

#gnome-terminal --tab -- sh -c 'node '$HOME'/poatest/test/aapp.js '${apple[$i]}


enode=($(cat enodeawslist.txt))
apple=($(cat ip.txt))
FILE=static-nodes.json
appleno=${#apple[@]}
((appleno--))
echo "[" > $FILE
i=0
while [ $i -lt ${#apple[@]} ]
do
if [ $i != $appleno ]
then
echo -n ${enode[$i]} >> $FILE
echo "," >> $FILE
else
echo ${enode[$i]} >> $FILE
echo "]" >> $FILE
fi
((i++))
done


