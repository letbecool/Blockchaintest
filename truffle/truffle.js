/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a 
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() { 
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>') 
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */

var fs = require('fs')

var array = fs.readFileSync(__dirname+'/ip.txt').toString().split("\n");
console.log(array[0])

module.exports = {  
  networks: {
    development: {
      host: array[0],
      port: 8545,
      network_id: "7895",
      gas: 1000000,
      gasPrice: 100000000000
    }
  }
};
