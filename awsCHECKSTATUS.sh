#!/bin/bash

apple=($(cat ip.txt))
cd $HOME
date
i=0
while [ $i -lt ${#apple[@]} ]
do

#ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth --datadir .cobuna attach --exec "web3.eth.blockNumber"'
ssh -i cobuna_key.pem ubuntu@${apple[$i]} "bash -s" << EOF
    echo "node $i"
    echo -n "block number   : " && geth --datadir .cobuna attach --exec "web3.eth.blockNumber"
    echo -n "pending transaction : " && geth --datadir .cobuna attach --exec "web3.txpool.status.pending"
EOF

((i++))
done


echo "**********CHECKING BLOCKNUMBER $1***************"



