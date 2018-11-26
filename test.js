'use strict';
// Web3 = require("web3");

//var net = require('net')
//var web3 = new Web3('/home/bikeshrestha/awesomeProject/Blockchaintest/nodes/node3/geth.ipc', net);

console.log("connected to local network")

const args = process.argv.slice(2)

console.log(args[0])
var ab = parseFloat(11.11111).toFixed(2)
console.log(ab)
var b;
if(args[0] != undefined) {
     b = args[0]
}else{
    console.log("please pass argument")
}
console.log("successful", b)

   
/*
web3.eth.filter("pending").watch(
    function(error,result){
        if (!error) {
            console.log(result);
        }
    }
)
*/