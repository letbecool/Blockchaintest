#!/bin/bash
apple=(18.136.200.8 52.221.249.89 54.254.146.133 152.15.56.46 13.58.227.154)
array=($(ls keystore))
cd $HOME
for i in {0..4}
do

if [ $i == 0 ] || [ $i == 1 ] || [ $i == 2 ]
then
#gnome-terminal --tab -- sh -c 'ssh -i cobuna_key.pem ubuntu@'${apple[$i]}'; $SHELL'
#sleep 2
scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/keystore/${array[$i]} ubuntu@${apple[$i]}:~/cobuna/keystore
sleep 1
else
scp -i titanaws.pem /home/bikeshrestha/awesomeProject/Blockchaintest/keystore/${array[$i]} ubuntu@${apple[$i]}:~/cobuna/keystore
fi
#gnome-terminal --tab -- sh -c 'ssh -i titanaws.pem ubuntu@'${apple[$i]}'; $SHELL'

done




