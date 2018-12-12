#!/bin/bash

DATADIR=.cobuna

sudo apt-get install jq

echo "Node is running................................."
array=($(ls $DATADIR/keystore))
address=$(cat $DATADIR/keystore/${array[0]} | jq -r ".address")
echo '0x'$address
geth --networkid 7895 --nodiscover --syncmode "full" --cache 512 --rpc --rpcaddr 0.0.0.0 --rpcapi 'web3, eth, miner' --rpccorsdomain "*" --unlock '0x'$address --password 'password.txt'  2> console.log
