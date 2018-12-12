#!/bin/bash

enode=($(cat enodeaws.txt))
echo -n "" > enodeaws1.txt
if [ -z $1 ]
then
apple=($(cat ip.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
echo -n "\"enode://" >> enodeaws1.txt
echo -n "${enode[$i]}" >> enodeaws1.txt
echo -n "@" >> enodeaws1.txt
echo -n "${apple[$i]}" >> enodeaws1.txt
echo ":30303\"" >> enodeaws1.txt
echo "Success$i"
((i++))
done

else
apple=($(cat ip2.txt))
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do
echo -n "\"enode://" >> enodeaws1.txt
echo -n "${enode[$i]}" >> enodeaws1.txt
echo -n "@" >> enodeaws1.txt
echo -n "${apple[$i]}" >> enodeaws1.txt
echo ":30303\"" >> enodeaws1.txt
echo "Success$i"
((i++))
done
fi


echo "**********GENERATE ENODE $1***************"



