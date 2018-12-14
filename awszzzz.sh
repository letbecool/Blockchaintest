#!/bin/bash
# must pass ip as a argument


   # nohup geth --nodiscover --syncmode "full" --cache 512 --rpc --rpcaddr 0.0.0.0 --rpcapi 'web3, eth, clique' --rpccorsdomain "*" --networkid 7895 > console.log 2>&1 > /dev/null &    sleep 10

#    nohup geth --nodiscover --syncmode "full" --cache 512 --rpc --rpcaddr 0.0.0.0 --rpcapi 'web3, eth' --rpccorsdomain "*" --networkid 7895 --unlock '0x$address' --password "testing" > my.log 2>&1 < /dev/null & echo $! > save_pid.txt
#ssh -f -i cobuna_key.pem ubuntu@52.74.122.251 "sh -c \"(nohup geth --nodiscover --syncmode "full" --cache 512 --rpc --rpcaddr 0.0.0.0 --rpcapi 'web3, eth, clique' --rpccorsdomain "*" --networkid 7895 > console.log 2>&1) > /dev/null &\""

#nohup sleep 30; touch nohup-exit

if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi
array=($(ls keystore))
BRANCH=blocksim
cd $HOME
i=0
while [ $i -lt ${#apple[@]} ]
do

ssh -i cobuna_key.pem ubuntu@${apple[$i]} "bash -s" << EOF
    geth --datadir .cobuna attach --exec "web3.eth.blockNumber"
    geth --datadir .cobuna attach --exec "web3.txpool.status"
EOF

echo "Success$i"
((i++))
done
