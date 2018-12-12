#!/bin/bash
# must pass ip as a argument
#GENESIS=genesispoa8miner.json
GENESIS=genesispoa4miner.json
#GENESIS=genesispoa1miner.json
NOOFMINER=4
BRANCH=benchmarking

# killing node process and copying result
if [ -z $1 ]
then
./awskillgethprocess.sh
./awsCOPYresult.sh

# new setup
elif [ $1 == 1 ]
then
# two command generate static-nodes.json file for all peered
./awsenodelistgenerate.sh
./awsenodestaticjson.sh
./awscopygenesis.sh $GENESIS # copy genesis two argument genesis file and 
./awsINITnode.sh  $GENESIS # init
./awscopynodekey.1.sh # copy nodekey
./awscopykeystore.sh # copy keystore
./awsCREATEpwfile.sh # create file
./awscopystaticnodsjson.sh # copystatic
#./awskillgethprocess.sh
./awsgethscriptcopy.sh # copy script to run node
./awsRUNnode.sh # depends on ./awsgethscriptcopy.sh
sleep 15
./awsMine.sh $NOOFMINER # argument is number of miner

# new node service in already existing
elif [ $1 == 2 ]
then
./awskillgethprocess.sh
./awsCOPYresult.sh
./awsdeletenodeinfo.sh
./awscopygenesis.sh $GENESIS # copy genesis two argument genesis file and 
./awsINITnode.sh  $GENESIS # init
#./awscopystaticnodsjson.sh
./awsRUNnode.sh # depends on ./awsgethscriptcopy.sh
sleep 15
./awsMine.sh $NOOFMINER # argument is number of miner

# restart node service
elif [ $1 == 3 ]
then
./awskillgethprocess.sh
./awsCOPYresult.sh
./awsRUNnode.sh
sleep 15
./awsMine.sh $NOOFMINER

elif [ $1 = 4 ]
then
./awsupdatecode.sh $BRANCH
./aws 2


else

echo "Please pass argument as 1 or 2 or 3 or null"

fi
echo "null  : kill process and copy result"
echo "1     : initial start node"
echo "2     : setup other configuration"
echo "3     : restart node "
echo "4     : update code and run node"
echo "**************PROCESS COMPLETE $1****************"

if [ ! -z $1 ]
then
while true; do ./awsCHECKSTATUS.sh ; sleep 60; done
fi

