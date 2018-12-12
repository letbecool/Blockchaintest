#!/bin/bash
# must pass ip as a argument
#GENESIS=genesispoa3miner.json
#GENESIS=genesispoa10s_5M.json
GENESIS=genesis1miner.json
if [ -z $1 ]
then
./awscopygenesis.sh $GENESIS # copy genesis two argument genesis file and 
./awsINITnode.sh  $GENESIS # init
./awscopynodekey.sh # copy nodekey
./awscopykeystore.sh # copy keystore
./awsCREATEpwfile.sh # create file
./awscopystaticnodsjson.sh # copystatic
./awsINSTANCE.sh

else 

#./awscopygenesis.sh $GENESIS 1 # copy genesis two argument genesis file and 
./awsINITnode.sh  $GENESIS 1 # init
./awscopynodekey.sh 1 # copy nodekey
./awscopykeystore.sh 1 # copy keystore
./awsCREATEpwfile.sh 1 # create file
./awscopystaticnodsjson.sh 1 # copystatic
./awsINSTANCE.sh 1
fi

# run nodes
# mine


echo "**************PROCESS COMPLETE $1****************"



