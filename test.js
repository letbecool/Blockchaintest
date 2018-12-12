var fs = require('fs');
const homedir = require('os').homedir();
/*
var array = fs.readFileSync('/home/bikeshrestha/awesomeProject/Blockchaintest/ip.txt').toString().split("\n");
for(i in array) {
    console.log(array[i]);
}*/


var contents = fs.readFileSync(homedir+'/awesomeProject/Blockchaintest/truffle/contractaddress.txt', 'utf8');
console.log(contents);
var array = fs.readFileSync(homedir+'/awesomeProject/Blockchaintest/ip.txt').toString().split("\n");
console.log(array[0])


console.log(__dirname)