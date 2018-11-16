Web3 = require("web3");

var net = require('net')
var web3 = new Web3('/home/bikeshrestha/awesomeProject/Blockchaintest/nodes/node3/geth.ipc', net);

console.log("connected to local network")



   
/*
web3.eth.filter("pending").watch(
    function(error,result){
        if (!error) {
            console.log(result);
        }
    }
)
*/