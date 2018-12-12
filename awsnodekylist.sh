#!/bin/bash
# must pass ip as a argumen
genesis=genesis/genesis.json
dataDir=nodes/node
echo -n "" > nodekey.txt
for i in {0..30}
do

echo `cat $dataDir$i/geth/nodekey` >> nodekey.txt
echo "success $i"
sleep 1
done


