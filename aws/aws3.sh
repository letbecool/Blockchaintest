#!/bin/bash
# must pass ip as a argument


IP=$1

#ARRAY=`($(ls /home/ubuntu/.cobuna/cobuna/keystore))`
echo $IP

cd ~
ssh -i cobuna_key.pem ubuntu@$IP "bash -s" << EOF
    
EOF

echo $ARRAY






