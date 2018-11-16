#!/bin/bash

dataDir=nodes/node
port=3031
rpcport=850
bootnode=enode://32e2bfdfba1b2150837f25900b54fd040865bb34177f9566c885602a50a5ce14c9c66e959e7737aa97cda21c84767af28c3a472b22868cbd2e47b9c10d274944@127.0.0.1:30310

array=($(ls keystore))

gnome-terminal --tab -- sh -c 'bootnode -nodekey boot.key -verbosity 9 -addr :30310; $SHELL'
echo "bootnode running in different tab."

# setting 5 node 
for i in {1..3}
do
   if [ ! -d $dataDir$i ]
   then
   geth --datadir $dataDir$i init genesis.json
   echo "Node $i setup successufl"
   sleep 3
   fi

   # copying keystore file to node
   if [ -z "$(ls -A $dataDir$i/keystore)" ]
   then
   echo "copying keystore file to node 1"
   cp keystore/${array[$i-1]} $dataDir$i/keystore
   fi

   address=$(cat keystore/${array[$i-1]} | jq '.address')

   #running nodes
   if [ $i == 1 ]
   then
   gnome-terminal  --tab  -- sh -c 'geth --datadir '$dataDir$i' --syncmode 'full' --port '$port$i' --rpc --rpcaddr 'localhost' --rpcport '$rpcport$i' --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes '$bootnode' --networkid 7895 --unlock '0x$address' --password 'password.txt' --mine console; $SHELL'
   echo "Node $i is running in different tab successfully."
   else
   gnome-terminal  --tab  -- sh -c 'geth --datadir '$dataDir$i' --syncmode 'full' --port '$port$i' --rpc --rpcaddr 'localhost' --rpcport '$rpcport$i' --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes '$bootnode' --networkid 7895 --unlock '0x$address' --password 'password.txt' console; $SHELL'
   echo "Node $i is running in different tab successfully."
   fi
done

echo "Three node are running in different."
