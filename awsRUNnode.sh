#!/bin/bash



if [ -z $1 ]
then
apple=($(cat ip.txt))
else
apple=($(cat $1))
fi
cd $HOME

i=0
while [ $i -lt ${#apple[@]} ]
do

#ssh -i cobuna_key.pem ubuntu@${apple[$i]} "sh -c \"(nohup geth --networkid 7895 --nodiscover --syncmode "full" --cache 512 --rpc --rpcaddr 0.0.0.0 --rpcapi 'web3, eth, clique' --rpccorsdomain "*" --unlock '0x$address' --password 'password.txt'  > console.log 2> log.err) > /dev/null &\""
#ssh -i cobuna_key.pem ubuntu@${apple[$i]} "screen -dmS Geth bash -c \"geth --networkid 7895 --nodiscover --syncmode "full" --cache 512 --rpc --rpcaddr 0.0.0.0 --rpcapi 'web3, eth, miner' --rpccorsdomain "*"  2> console.log\""
ssh -i cobuna_key.pem ubuntu@${apple[$i]} "screen -dmS Geth ./geth.sh"
echo "Success$i"
((i++))
done

echo "**********RUN COMPLETED $1***************"




