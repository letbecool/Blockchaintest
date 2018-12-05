#!/bin/bash

# ./setupnodes.1.sh arg1 arg2
# arg1=genesisfieNameOnly which is in genesis folder
# arg2 is tps to file
DATADIR=nodes/node
PORT=3031
RPCPORT=850
#bootnode=enode://32e2bfdfba1b2150837f25900b54fd040865bb34177f9566c885602a50a5ce14c9c66e959e7737aa97cda21c84767af28c3a472b22868cbd2e47b9c10d274944@127.0.0.1:30310
NETWORKID=7895

#this will take an argument to set up network

[[ ! -z $1 ]] || GENESIS=genesis/genesispoa10s_10M.json
GENESIS=genesis/$1


[[ ! -z $2 ]] || NOOFNODES=5
NOOFNODES=$2


#gnome-terminal --tab -- sh -c 'bootnode -nodekey boot.key -verbosity 9 -addr :30310; $SHELL'
#echo "bootnode running in different tab."
./setupnodes.sh $GENESIS $NOOFNODES
sleep 1

#for running nodes
i=1
while [ $i -le $NOOFNODES ]
do
   #parsing address from keystore json file 
   address=$(cat keystore/${array[$i-1]} | jq '.address')

   #running nodes
   #rm -rf $DATADIR$i/geth/chaindata $DATADIR$i/geth/transactions.rlp
   gnome-terminal  --tab  -- sh -c 'geth --datadir '$DATADIR$i' --syncmode 'full' --port '$PORT$i' --rpc --rpcaddr 'localhost' --rpcport '$RPCPORT$i' --rpcapi 'personal,db,eth,net,web3,txpool,miner' --networkid '$NETWORKID' --unlock '0x$address' --password 'password.txt' 2> 'outputs/$i$(date)'; $SHELL'

   echo "Node $i is running in different tab successfully."    
   ((i++))
done

sleep 15

miners=`geth --datadir ${DATADIR}1 attach --exec 'web3.clique.getSigners().length'`



i=1
j=1 #for counting miners in poa
while [ $i -le $NOOFNODES ]
do
if [ $i != 2 ]
then
geth --datadir $DATADIR$i attach --exec 'web3.miner.start()'
sleep 1
((j++))
fi
((i++))
done
echo "5 node are running in different tabs."

[[ $j == $miners ]] || exit "### some error may be with genesis file number of miners"


sleep 12
#deploying smart contract using truffle
cd truffle 
truffle migrate


if [ ! -z $2 ]
then
#firing transaction
sleep 5
cd ..
echo $2
node app.js $2
fi
