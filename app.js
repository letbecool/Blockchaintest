Web3 = require("web3");
utils = require('./utils')
fs = require('fs')

// set the provider you want from Web3.providers
var net = require('net')
var web3 = new Web3('/home/bikeshrestha/awesomeProject/Blockchaintest/nodes/node3/geth.ipc', net);


console.log("connected to local network")


/*
fs.writeFile(`${__dirname}/outputs/web3input.csv`, '' , err => {
    if (!err) {
        console.log('file empty')
    } else {
        console.log(err)
    }
})
*/
/*
fs.writeFile(`${__dirname}/outputs/web3output.csv`, '' , err => {

    if (!err) {

        console.log('file empty')

    } else {

        console.log(err)

    }


})

*/

let i = 0;
let j = 0;
web3.eth.defaultAccount = web3.eth.accounts[0]
//web3.eth.personal.unlockAccount(web3.eth.defaultAccount,"testing",0)

const abi = [
	{
		"constant": false,
		"inputs": [
			{
				"name": "uid",
				"type": "uint256"
			},
			{
				"name": "_plid",
				"type": "bytes32"
			},
			{
				"name": "_iid",
				"type": "bytes32"
			}
		],
		"name": "getID",
		"outputs": [
			{
				"name": "",
				"type": "bytes32"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "cauid",
				"type": "bytes32"
			},
			{
				"indexed": false,
				"name": "uid",
				"type": "uint256"
			}
		],
		"name": "LogOfCauidGen",
		"type": "event"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "cauid",
		"outputs": [
			{
				"name": "",
				"type": "bytes32"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]
const contractAddress =  '0xfc9c485f0ba3ea7b69beb9fc1c444057cd16114b';
const contractInstance = new web3.eth.Contract(abi,contractAddress);

const tps = 100;

/*
contractInstance.LogOfCauidGen().watch((error, result) => {

    if (!error) {
// console.log('got event' + j)
        utils.saveInputToCsv(`${result.args.cauid} ,${result.args.uid} ,${utils.getCurentDateTime()}`, 'web3output.csv');

console.log(result.logIndex)
        j++

}else{
console.log(error)
}

});

*/

contractInstance.events.LogOfCauidGen()
.on('data',function(event){
	console.log(event)
})
.on('error',function(error){
	console.log(error)
})


var d = new Date();

web3.eth.extend({
	property: 'txpool',
	methods: [{
	  name: 'content',
	  call: 'txpool_content'
	},{
	  name: 'inspect',
	  call: 'txpool_inspect'
	},{
	  name: 'status',
	  call: 'txpool_status'
	}]
  });
  

web3.eth.subscribe('newBlockHeaders', (error, block) => {
        if(!error) {
    web3.eth.getBlock(block.number).then(function(value){
	web3.eth.txpool.status().then(function(result){
 	console.log(result.pending);
	console.log(value.size)
	utils.saveInputToCsv(`${value.number}, ${value.timestamp} ,${value.gasUsed},${value.size},${value.transactions.length}, ${parseInt(result.pending)} , ${value.difficulty}, ${value.totalDifficulty},${parseInt(result.queued)}`, d.getDay()+'_'+tps+'.csv');
})
}).catch(console.error)

        } else {
            console.log('Error:', error);          
        }
    });





var doStuff1 = function (d2) {


if(Date.now()<d2) {
    let iid = utils.genRandomStr(8)
    let plid = utils.genRandomStr(8)
    let uid = i


    //contractInstance.getID(i, iid, plid,{gas:32000})

	contractInstance.methods
	.getID(i, iid, plid)
	.send({
		from: '0x2e4414a44c0e24c06190c0136390bd541fc34b5a',
		gas: 50000,
		gasPrice: 100000000000
	},function (error, value) {
		if(!error){
			utils.saveInputToCsv(`${i} ,${plid} ,${iid} ,${utils.getCurentDateTime()}`, d.getDay()+'_'+'web3input'+'_'+tps+'.csv');
		} 
	}).catch(console.log)
    console.log(i)

    i++
}else{
    clearInterval(x)
console.log("Completed.......Completed........Completed")

}};





var d1 = new Date ();
var d2 = new Date ( d1 );
var time= d2.setMinutes(d1.getMinutes() + 10);


console.log(time)
var x=setInterval(doStuff1,tps,time);
















