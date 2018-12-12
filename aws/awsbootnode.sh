#!/bin/bash
# must pass ip as a argument


IP=$1

#ARRAY=`($(ls /home/ubuntu/.cobuna/cobuna/keystore))`
echo $IP
scp -i cobuna_key.pem /home/bikeshrestha/awesomeProject/Blockchaintest/boot.key ubuntu@$IP:~

cd ~
ssh -i cobuna_key.pem ubuntu@$IP "bash -s" << EOF
    
EOF

echo $ARRAY






