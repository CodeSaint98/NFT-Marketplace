const { task } = require("hardhat/config");
const { getAccount } = require("./helpers");


task("check-balance", "Prints out the balance of your account").setAction(async function (taskArguments, hre) {
    const account = getAccount();
    console.log(`Account balance for ${account.address}: ${await account.getBalance()}`);
});

task("deploy", "Deploys the NFT.sol contract").setAction(async function (taskArguments, hre) {
    const nftContractFactory = await hre.ethers.getContractFactory("RowdyNFT", getAccount());
    const nft = await nftContractFactory.deploy('0xF57B2c51dED3A29e6891aba85459d600256Cf317','0x1b99Ec5A406c37013C9E6eAb8E8c9C2dc1BCE94f',5005);
    console.log(`Contract deployed to address: ${nft.address}`);
});

task("deploy-factory", "Deploys the NFTFactory.sol contract").setAction(async function (taskArguments, hre) {
    const nftfactoryContractFactory = await hre.ethers.getContractFactory("RowdyFactory", getAccount());
    const nftfactory = await nftfactoryContractFactory.deploy('0xF57B2c51dED3A29e6891aba85459d600256Cf317','0x4647B9cfDfeA7EA1Bf295f8563E5c56Ed69FAB32');
    console.log(`Contract deployed to address: ${nftfactory.address}`);
});