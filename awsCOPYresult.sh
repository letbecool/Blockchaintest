#!/bin/bash


if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi
TRIM=$1 # to trim store argument in variable 
YEAR=`date +"%Y"`
TIME=`date +"%T"`
cd $HOME
DIR=$HOME/awesomeProject/Blockchaintest/outputs/$YEAR/$TIME${TRIM::-4}
mkdir -p $DIR
i=0
while [ $i -lt ${#apple[@]} ]
do

scp -i cobuna_key.pem ubuntu@${apple[$i]}:~/.cobuna/result.txt $DIR/result$i.txt
scp -r -i cobuna_key.pem ubuntu@${apple[$i]}:~/Blockchaintest/outputs/ $DIR/node$i
scp -i cobuna_key.pem ubuntu@${apple[$i]}:~/console.log $DIR/consle$i.log

#ssh -i cobuna_key.pem ubuntu@${apple[$i]} "rm .cobuna/result.txt"
#ssh -i cobuna_key.pem ubuntu@${apple[$i]} "bash -s" << EOF
#    rm .cobuna/result.txt
#    rm -rf Blockchaintest/outputs
#    rm console.log
#EOF

echo "Success$i"
((i++))
done



echo "**********COPY RESULT $1***************"






