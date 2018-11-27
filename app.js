Web3 = require("web3");
utils = require('./utils')
fs = require('fs')

// set the provider you want from Web3.providers
var net = require('net')
var web3 = new Web3('/home/bikeshrestha/awesomeProject/Blockchaintest/nodes/node2/geth.ipc', net);


console.log("connected to local network")

const args = process.argv.slice(2)



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
var contractAddress, tps;
if(args[1] != undefined){
	contractAddress = args[1].toString();
}else{
 	contractAddress = '0x0864c263423928ffe47560e1daa3d5fa9490447d';
}

if(args[0] != undefined){
	tps = parseInt(args[0]);
}else{
	tps = 10;
}

const contractInstance = new web3.eth.Contract(abi,contractAddress);
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
 
var b = 0;

// subscribe to event when new block is created
web3.eth.subscribe('newBlockHeaders', (error, block) => {
        if(!error) {
    web3.eth.getBlock(block.number).then(function(value){
	web3.eth.txpool.status().then(function(result){
 	console.log(result.pending);
	console.log(value.size)
	utils.saveInputToCsv(`${value.number}, ${value.timestamp} ,${value.gasUsed},${value.size},${value.transactions.length}, ${parseInt(result.pending)} , ${value.difficulty}, ${value.totalDifficulty}`, d+'_'+tps+'.csv');
	
	if(b==100){
		process.exit(1)
	}
	b++
	
})
}).catch(console.error)

        } else {
            console.log('Error:', error);          
        }
});


// pending transaction every 1 second

setInterval(function(){
	web3.eth.getBlockNumber().then(function(block){
		web3.eth.getBlock(block).then(function(value){
			web3.eth.txpool.status().then(function(result){
			utils.saveInputToCsv(`${value.number}, ${value.timestamp} ,${value.gasUsed},${value.size},${value.transactions.length}, ${parseInt(result.pending)} , ${value.difficulty}, ${value.totalDifficulty},${parseInt(result.queued)}`, d+'_'+'every1sec'+tps+'.csv');
		})
	})
	})
	
},1000)


var doStuff1 = function (d2) {


if(Date.now()<d2) {
    let iid = utils.genRandomStr(8)
    let plid = utils.genRandomStr(8)
    let uid = i
    //contractInstance.getID(i, iid, plid,{gas:32000})
	contractInstance.methods
	.getID(i, iid, plid)
	.send({
		from: '0x142612093efca0f055d10476493ca9a63b6e436c',
		gas: 50000,
		gasPrice: 100000000000
	},function (error, value) {
		if(!error){
			utils.saveInputToCsv(`${i} ,${plid} ,${iid} ,${utils.getCurentDateTime()}`, d+'_'+'web3input'+'_'+tps+'.csv');
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
var time= d2.setMinutes(d1.getMinutes() + 30);


console.log(time)
var x=setInterval(doStuff1,1000/tps,time);