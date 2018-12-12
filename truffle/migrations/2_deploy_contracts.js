var TestGenerator = artifacts.require("./TestGenerator.sol");

var fs = require('fs');


module.exports = function(deployer) {
  deployer.deploy(TestGenerator)
  .then(()=> fs.writeFile('contractaddress.txt',TestGenerator.address, function(err,data){
    if (err) console.log(err);
    console.log("Successfully. contract address is: " + TestGenerator.address);
  }))
};
