Web3 = require("web3");
utils = require('./utils')
fs = require('fs')

// set the provider you want from Web3.providers
web3 = new Web3(new Web3.providers.HttpProvider("http://52.221.241.19:8545"));

console.log("connected to local network")


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


const Contract = web3.eth.contract(abi);

const contractInstance = Contract.at("0xfc9c485f0ba3ea7b69beb9fc1c444057cd16114b");

    // fifteen sec blocktime
    //'contractaddress': '0xcdb019a14c47b9ae50aee0cad95e56cefd73d477'

    // onesec blocktime
    //'contractaddress': '0x0768906a4990e01a68a8eff1140839922a97dfc5' 

    
    // twosec blocktime
   // 'contractaddress': '0x7d6e4bd454bf1c17d2a7dc95dd570df21057fe5f' 

    // tensec blocktime
   // 'contractaddress': '0x0d0eee0688dc0e75ddce2e6bd8a1034f97b52a0f'

	// fivesec blocktime
	//0x24f6d603c463339368107b15b251dda2fb397008

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





var doStuff1 = function (d2) {
console.log(d2 - Date.now());

if(Date.now()<d2) {
    let iid = utils.genRandomStr(8)
    let plid = utils.genRandomStr(8)
    let uid = i


    //contractInstance.getID(i, iid, plid,{gas:32000})

    contractInstance.getID(i, iid, plid, {gasPrice: "20000000000", gas: 32000}, function (error, value) {
        utils.saveInputToCsv(`${i} ,${plid} ,${iid} ,${utils.getCurentDateTime()}`, 'web3input.csv');


    })
    console.log(i)

    i++
}else{
    clearInterval(x)
console.log("Completed.......Completed........Completed")

}


};



/*

var doStuff1 = function (a) {

		console.log("checking"+a)


};



*/



var d1 = new Date ();
var d2 = new Date ( d1 );
var time= d2.setMinutes(d1.getMinutes() + 10);


console.log(time)
/*console.log(d1)
console.log(d2)
console.log(new Date())
console.log( new Date() <d2 )*/

//doStuff1(d2)

var x=setInterval(doStuff1,50,time);


// setInterval(doStuff1,100)
/*for(var k = 0; k < 5000;k++){
    let iid = utils.genRandomStr(8)
    let plid = utils.genRandomStr(8)
    let uid = i


    //contractInstance.getID(i, iid, plid,{gas:32000})


    contractInstance.getID(i, iid, plid,{gas:32000},function (error, value){
        utils.saveInputToCsv(`${iid} ,${plid} ,${uid} ,${utils.getCurentDateTime()}`, 'web3input.csv');
    })

    i++
}
*/















