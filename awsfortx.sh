#!/bin/bash

apple=($(cat ip.txt))
cd $HOME

i=0
while [ $i -lt ${#apple[@]} ]
do

#ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth --datadir .cobuna attach --exec "web3.eth.blockNumber"'
ssh -i cobuna_key.pem ubuntu@${apple[$i]} "bash -s" << EOF
    git clone https://github.com/bikeshrestha/Blockchaintest.git
    cd Blockchaintest
    mkdir outputs
    git pull
    git checkout awstx
EOF

((i++))
done


echo "**********CHECKING BLOCKNUMBER $1***************"



