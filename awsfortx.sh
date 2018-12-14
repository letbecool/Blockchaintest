#!/bin/bash

# only 1 node

if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi
cd $HOME
NO=${#apple[@]}
i=0
while [ $i -lt ${#apple[@]} ]
do



#ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth --datadir .cobuna attach --exec "web3.eth.blockNumber"'
ssh -i cobuna_key.pem ubuntu@${apple[$i]} "bash -s" << EOF
    git clone https://github.com/bikeshrestha/Blockchaintest.git
    cd Blockchaintest
    git checkout awstx
    git pull
    npm install
EOF


((i++))
done


echo "**********SETTING FOR TRASACTION ***************"



