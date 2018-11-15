var TestGenerator = artifacts.require("./TestGenerator.sol");

module.exports = function(deployer) {
  deployer.deploy(TestGenerator)
  .then(()=> console.log(TestGenerator.address))
};
