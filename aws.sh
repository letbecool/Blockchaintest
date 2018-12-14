#!/bin/bash
# must pass ip as a argument
#GENESIS=genesispoa8miner.json
#GENESIS=genesispoa4miner.json
GENESIS=genesispoa1miner.json
NOOFMINER=1
# working on branch to update code
BRANCH=benchmarkblock
# 1 for all peered codition
# 2 for other configuration network
NETWORKCONF=1 # please change as requirement in awsenodestaticjson.sh
#IPDIR=ipsgp3nodes.txt
IPDIR=ip.txt

# killing node process and copying result
if [ -z $1 ]
then
./awskillgethprocess.sh $IPDIR
./awsCOPYresult.sh $IPDIR # after copying kill process

# new setup
elif [ $1 == 1 ]
then
# two command generate static-nodes.json file for all peered

./awsenodelistgenerate.sh $IPDIR
./awsenodestaticjson.sh $NETWORKCONF $IPDIR

./awscopygenesis.sh $GENESIS $IPDIR # copy genesis two argument genesis file and 
./awsdeletenodedir.sh $IPDIR
./awsINITnode.sh  $GENESIS $IPDIR # init
./awscopynodekey.1.sh $IPDIR # copy nodekey
./awscopykeystore.sh $IPDIR # copy keystore
./awsCREATEpwfile.sh $IPDIR # create file
# if argument is passed for other network configuration then all peered
./awscopystaticnodsjson.sh $NETWORKCONF $IPDIR # copystatic
#./awskillgethprocess.sh
./awsgethscriptcopy.sh $IPDIR # copy script to run node
./awsRUNnode.sh $IPDIR # depends on ./awsgethscriptcopy.sh
sleep 15
./awsMine.sh $NOOFMINER $IPDIR # argument is number of miner

# for transaction

cd truffle
truffle migrate
cd ..

./awsfortx.sh $IPDIR
./awsfortxhit.sh $IPDIR


# new node service in already existing
elif [ $1 == 2 ]
then
#./awskillgethprocess.sh
#./awsCOPYresult.sh

#./awsenodelistgenerate.sh
#./awsenodestaticjson.sh $NETWORKCONF

./awscopygenesis.sh $GENESIS
./awsdeletenodeinfo.sh
./awsINITnode.sh  $GENESIS # init
./awscopystaticnodsjson.sh $NETWORKCONF # copystatic
sleep 5
#./awscopystaticnodsjson.sh
./awsRUNnode.sh # depends on ./awsgethscriptcopy.sh
sleep 10
#./awsCREATEpwfile.sh # create file
./awsMine.sh $NOOFMINER # argument is number of miner

# for transaction
# deploy smartcontract
cd truffle
truffle migrate
cd ..

# fire transaction
./awsfortxhit.sh 


# restart node service
elif [ $1 == 3 ]
then
#./awskillgethprocess.sh
#./awsCOPYresult.sh
./awsRUNnode.sh
sleep 15
./awsMine.sh $NOOFMINER

# for transaction
cd truffle
truffle migrate
cd ..

./awsfortxhit.sh 

elif [ $1 = 4 ]
then
./awsupdatecode.sh $BRANCH $IPDIR
./aws.sh 2


else

echo "Please pass argument as 1 or 2 or 3 or null"

fi

if [ ! -z $1 ]
then
while true; do ./awsCHECKSTATUS.sh $IPDIR; sleep 60; done
fi