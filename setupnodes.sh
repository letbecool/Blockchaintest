#!/bin/bash

# ./setupnodes.1.sh arg1 arg2
# arg1=genesisfieNameOnly which is in genesis folder

[[ ${#} == 2 ]] || exit "### setunodes take two argument genesis json file and noofnodes"

[[ $1 =~ ^[A-Za-z0-9._%+-]+\.json$ ]] || exit "### file format must in json"
GENESIS=genesis/$1
echo $GENESIS
[[ -f $GENESIS ]] || exit "### there is no genesis file"

# exit with message if argument 2 is not array
[[ $2 =~ ^[0-9]+$ ]] || exit "### integer is accepted"
NOOFNODES=$2




DATADIR=nodes/node
PORT=3031

#bootnode=enode://32e2bfdfba1b2150837f25900b54fd040865bb34177f9566c885602a50a5ce14c9c66e959e7737aa97cda21c84767af28c3a472b22868cbd2e47b9c10d274944@127.0.0.1:30310

#this will take an argument to set up network



array=($(ls keystore))
i=1
#gnome-terminal --tab -- sh -c 'bootnode -nodekey boot.key -verbosity 9 -addr :30310; $SHELL'
#echo "bootnode running in different tab."
if [ ! -d nodes ]
then
echo -n "" > enode.txt
# setting 5 node 

while [ $i -le $NOOFNODES]
do
   geth --datadir $DATADIR$i init $GENESIS
   echo "Node $i setup successufl"
   sleep 1
   # copying keystore file to node
   #if [ -z "$(ls -A $DATADIR$i/keystore)" ]   
   echo "copying keystore file to node 1"
   cp keystore/${array[$i-1]} $DATADIR$i/keystore 

   geth --datadir $DATADIR$i --port $PORT$i --exec 'web3.admin.nodeInfo.enode' >> enode.txt console
   sleep 1
   ((i++))
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

static-file $DATADIR"1"/geth/static-nodes.json 1 2 
static-file $DATADIR"2"/geth/static-nodes.json 0 3 
static-file $DATADIR"3"/geth/static-nodes.json 0 3 
static-file $DATADIR"4"/geth/static-nodes.json 1 2 4
static-file $DATADIR"5"/geth/static-nodes.json 3
else
while [ $i -le $NOOFNODES ]
do
rm -rf $DATADIR$i/geth/chaindata $DATADIR$i/geth/lightchaindata $DATADIR$i/geth/LOCK $DATADIR$i/geth/transactions.rlp $DATADIR$i/geth/nodes $DATADIR$i/history 
geth --datadir $DATADIR$i init $GENESIS
((i++))
done
fi



