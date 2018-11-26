#!/bin/bash
dataDir=nodes/node

for i in {1..5}
do
   echo "Welcome $dataDir$i times"
   if [ $i == 1 ]
   then 
   echo "welcome to 1"
   fi

done
array=(one two three)
echo ${array[1]}

hello=($(ls keystore))

echo ${hello[2]}

file=($(cat keystore/${hello[1]}))



IFS=$'\r\n' GLOBIGNORE='*' command eval  'enodes=($(cat enode.txt))'
echo "copying to nodes"
echo ${enodes[0]}


echo "success"



function static-file() {
    if [ $# == 2 ]
    then 
    echo "[" > $1
    echo ${enodes[$2]} >> $1
    echo "]" >> $1
    elif [ $# == 3 ]
    then
    echo "[" > $1
    echo -n ${enodes[$2]} >> $1
    echo "," >> $1
    echo ${enodes[$3]} >> $1  
    echo "]" >> $1
    elif [ $# == 4 ] 
    then 
    echo "[" > $1
    echo -n ${enodes[$2]} >> $1
    echo "," >> $1
    echo -n ${enodes[$3]} >> $1    
    echo "," >> $1
    echo ${enodes[$4]} >> $1
    echo "]" >> $1
    else
    echo "something went wrong"
    fi   
}


dataDir=nodes/node

echo $dataDir"1"
echo $dataDir"2"
echo $dataDir"3"
echo $dataDir"4"
echo $dataDir"5"


#printing date 
static-file nodes/node2/static-nodes.json 4
i=1
echo $i$(date)

#checking if directory exit and assiging to variable
b=$(ls nodese)
if [ $b == null ]
then
echo "nullllll"
fi





