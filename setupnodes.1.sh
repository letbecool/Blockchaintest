#!/bin/bash

dataDir=nodes/node
port=3031
rpcport=850
#bootnode=enode://32e2bfdfba1b2150837f25900b54fd040865bb34177f9566c885602a50a5ce14c9c66e959e7737aa97cda21c84767af28c3a472b22868cbd2e47b9c10d274944@127.0.0.1:30310
networkId=7895
genesis=genesispoa10s_10M.json
array=($(ls keystore))

#gnome-terminal --tab -- sh -c 'bootnode -nodekey boot.key -verbosity 9 -addr :30310; $SHELL'
#echo "bootnode running in different tab."



if [ ! -d nodes ]
then
echo -n "" > enode.txt
# setting 5 node 
for i in {1..5}
do
   geth --datadir $dataDir$i init $genesis
   echo "Node $i setup successufl"
   sleep 1
   # copying keystore file to node
   #if [ -z "$(ls -A $dataDir$i/keystore)" ]   
   echo "copying keystore file to node 1"
   cp keystore/${array[$i-1]} $dataDir$i/keystore 

   geth --datadir $dataDir$i --port $port$i --exec 'web3.admin.nodeInfo.enode' >> enode.txt console
   sleep 1
done


IFS=$'\r\n' GLOBIGNORE='*' command eval  'enodes=($(cat enode.txt))'

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

static-file $dataDir"1"/geth/static-nodes.json 1 2 
static-file $dataDir"2"/geth/static-nodes.json 0 3 
static-file $dataDir"3"/geth/static-nodes.json 0 3 
static-file $dataDir"4"/geth/static-nodes.json 1 2 4
static-file $dataDir"5"/geth/static-nodes.json 3
else


for i in {1..5}
do
rm -rf $dataDir$i/geth/chaindata $dataDir$i/geth/lightchaindata $dataDir$i/geth/LOCK $dataDir$i/geth/transactions.rlp $dataDir$i/geth/nodes $dataDir$i/history 
geth --datadir $dataDir$i init $genesis
done


fi





sleep 1


for i in {1..5}
do
   #parsing address from keystore json file 
   address=$(cat keystore/${array[$i-1]} | jq '.address')

   #running nodes
   #rm -rf $dataDir$i/geth/chaindata $dataDir$i/geth/transactions.rlp
   gnome-terminal  --tab  -- sh -c 'geth --datadir '$dataDir$i' --syncmode 'full' --port '$port$i' --rpc --rpcaddr 'localhost' --rpcport '$rpcport$i' --rpcapi 'personal,db,eth,net,web3,txpool,miner' --networkid '$networkId' --unlock '0x$address' --password 'password.txt' 2> 'outputs/$i$(date)'; $SHELL'

   echo "Node $i is running in different tab successfully."    
done

sleep 15


for i in {1..5}
do
if [ $i != 2 ]
then
geth --datadir $dataDir$i attach --exec 'web3.miner.start()'
sleep 1
fi
done


sleep 12

cd truffle 
truffle migrate







echo "5 node are running in different tabs."

