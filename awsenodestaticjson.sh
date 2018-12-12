#!/bin/bash
# must pass ip as a argument

#gnome-terminal --tab -- sh -c 'node '$HOME'/poatest/test/aapp.js '${apple[$i]}


enode=($(cat enodeawslist.txt))
apple=($(cat ip.txt))
FILE=static-nodes.json
appleno=${#apple[@]}
DATADIR=nodes/node
((appleno--))


if [ $1 == 1 ]
then
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


elif [ $1 == 2 ]
then
function static-file() {
    echo $2
    echo $3
    echo "***************"
echo "[" > $1

if [ $# == 2 ]
then
echo ${enode[$2]} >> $1
echo "]" >> $1

elif [ $# == 3 ]
then
echo -n ${enode[$2]} >> $1
echo "," >> $1
echo ${enode[$3]} >> $1
echo "]" >> $1

elif [ $# == 4 ]
then
echo -n ${enode[$2]} >> $1
echo "," >> $1
echo -n ${enode[$3]} >> $1
echo "," >> $1
echo ${enode[$4]} >> $1
echo "]" >> $1


else

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "***something wrong***"

fi

 
}



static-file $DATADIR"0"/$FILE 2
static-file $DATADIR"1"/$FILE 0 1
static-file $DATADIR"2"/$FILE 2
#static-file $DATADIR"3"/$FILE 2 4
#static-file $DATADIR"4"/$FILE 3


else 
echo "argument required for network type"


fi
echo "********successs generating static-nodes.json*******"