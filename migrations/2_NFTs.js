const nfts = artifacts.require("nfts");

module.exports = function (deployer) {
  deployer.deploy(nfts);
};
