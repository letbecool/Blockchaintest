#!/bin/bash
apple=(13.229.197.233 54.255.189.116 3.0.181.135 18.191.228.254 13.59.132.166)
array=($(ls keystore))
cd $HOME
for i in {0..4}
do

if [ $i == 0 ] || [ $i == 1 ] || [ $i == 2 ]
then
#gnome-terminal --tab -- sh -c 'ssh -i cobuna_key.pem ubuntu@'${apple[$i]}'; $SHELL'
#sleep 2
scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/keystore/${array[$i]} ubuntu@${apple[$i]}:~/.cobuna/keystore
sleep 1
else
scp -i titanaws.pem /home/bikeshrestha/awesomeProject/Blockchaintest/keystore/${array[$i]} ubuntu@${apple[$i]}:~/.cobuna/keystore
fi
#gnome-terminal --tab -- sh -c 'ssh -i titanaws.pem ubuntu@'${apple[$i]}'; $SHELL'

done




