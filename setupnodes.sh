#!/bin/bash

dataDir1=nodes/node1
dataDir2=nodes/node2
dataDir3=nodes/node3


# setting node for first time if not set
if [ ! -d $dataDir1 ]
then
geth --datadir $dataDir1 init genesis.json
echo "Node 1 setup successful"
sleep 3
fi

if [ ! -d $dataDir2 ]
then
geth --datadir $dataDir2 init genesis.json
echo "Node 2 setup successful"
sleep 3
fi

if [ ! -d $dataDir3 ]
then
geth --datadir $dataDir3 init genesis.json
echo "Node 3 setup successful"
sleep 3
fi



# running node in different terminal
gnome-terminal --tab -- sh -c 'bootnode -nodekey boot.key -verbosity 9 -addr :30310; $SHELL'
echo "bootnode running in different tab."

gnome-terminal  --tab  -- sh -c 'geth --datadir '$dataDir1' --syncmode 'full' --port 30311 --rpc --rpcaddr 'localhost' --rpcport 8501 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://32e2bfdfba1b2150837f25900b54fd040865bb34177f9566c885602a50a5ce14c9c66e959e7737aa97cda21c84767af28c3a472b22868cbd2e47b9c10d274944@127.0.0.1:30310' --networkid 7895 --unlock '0x78b25d90d0c6b2c6da588ab8621d32c93ab7510c' --password 'password.txt' --mine console; $SHELL'
echo "Node 1 is running in different tab successfully."

gnome-terminal  --tab  -- sh -c 'geth --datadir '$dataDir2' --syncmode 'full' --port 30312 --rpc --rpcaddr 'localhost' --rpcport 8502 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://32e2bfdfba1b2150837f25900b54fd040865bb34177f9566c885602a50a5ce14c9c66e959e7737aa97cda21c84767af28c3a472b22868cbd2e47b9c10d274944@127.0.0.1:30310' --networkid 7895 --unlock '0x142612093efca0f055d10476493ca9a63b6e436c' --password 'password.txt' console; $SHELL'
echo "Node 2 is running in different tab successfully."

gnome-terminal  --tab  -- sh -c 'geth --datadir '$dataDir3' --syncmode 'full' --port 30313 --rpc --rpcaddr 'localhost' --rpcport 8503 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://32e2bfdfba1b2150837f25900b54fd040865bb34177f9566c885602a50a5ce14c9c66e959e7737aa97cda21c84767af28c3a472b22868cbd2e47b9c10d274944@127.0.0.1:30310' --networkid 7895 --unlock '0x2e4414a44c0e24c06190c0136390bd541fc34b5a' --password 'password.txt' console; $SHELL'
echo "Node 3 is running in different tab successfully."

  

# copying keystore file to three different node 
if [ -z "$(ls -A $dataDir1/keystore)" ]; then
    echo "copying keystore file to node 1"
   cp keystore/UTC--2018-11-12T12-12-53.447380609Z--78b25d90d0c6b2c6da588ab8621d32c93ab7510c $dataDir1/keystore
fi

if [ -z "$(ls -A $dataDir2/keystore)" ]; then
    echo "copying keystore file to node 2"
   cp keystore/UTC--2018-11-12T12-13-03.853647756Z--142612093efca0f055d10476493ca9a63b6e436c $dataDir2/keystore
fi

if [ -z "$(ls -A $dataDir3/keystore)" ]; then
    echo "copying keystore file to node 3"
   cp keystore/UTC--2018-11-12T12-13-10.676270488Z--2e4414a44c0e24c06190c0136390bd541fc34b5a $dataDir3/keystore
fi





echo "Three node are running in different."
