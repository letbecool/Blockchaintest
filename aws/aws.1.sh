#!/bin/bash

#IP=18.136.200.8
#IP2=52.221.249.89
#IP3=54.254.146.133
#IP4=52.15.56.46
#IP5=13.58.227.154


#gnome-terminal --tab -- sh -c './aws1.sh; $SHELL'
#gnome-terminal --tab -- sh -c './aws2.sh $IP2 ; $SHELL'
#gnome-terminal --tab -- sh -c './aws3.sh $IP3 ; $SHELL'
#gnome-terminal --tab -- sh -c './aws4.sh $IP4 ; $SHELL'
#gnome-terminal --tab -- sh -c './aws5.sh $IP5 ; $SHELL'

#./awsCOPYresult.sh
#echo "copied result successfully."
#sleep 1

./awsdeletenodeinfo.sh 1
echo "deleted node info"
sleep 1

./awsINITnode.sh 1
echo "node init successfull."
sleep 1
./awscopynodekey.sh 1 # copy nodekey
./awscopykeystore.sh 1 # copy keystore
./awscopystaticnodsjson.sh 1
echo "static-node.json copied successfull."
sleep 1

# not necessary
#./awsDELETEresult.sh
#echo "deleted result.txt successfully."
#sleep 1

./awsINSTANCE.sh 1
sleep 1


