#!/bin/bash

# only 1 node

if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi

cd truffle
contractaddress=`cat contractaddress.txt`
TPS=5

cd $HOME
NO=${#apple[@]}

i=0
while [ $i -lt ${#apple[@]} ]
do

if [ $i == 1 ]
then

#ssh -i cobuna_key.pem ubuntu@${apple[$i]} 'geth --datadir .cobuna attach --exec "web3.eth.blockNumber"'
ssh -i cobuna_key.pem ubuntu@${apple[$i]} "bash -s" << EOF
    cd Blockchaintest
    mkdir outputs
    screen -S nodetx -dm node app.1.js $TPS $contractaddress 
EOF

else
ssh -i cobuna_key.pem ubuntu@${apple[$i]} "bash -s" << EOF
    cd Blockchaintest
    mkdir outputs
    screen -S nodetx -dm node app.2.js $contractaddress 
EOF

fi
((i++))
done



echo "**********Firing transaction***************"