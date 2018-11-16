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
echo $file