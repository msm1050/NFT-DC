const nfts = artifacts.require("./nfts.sol");

const {assert, should} = require("chai");

require("chai").use(require('chai-as-promised')).should();

contract("nfts",(accounts)=>{
    let contract;
    //It will not exeute anything unless before statement executed;
    before(async()=>{
        contract = await nfts.deployed();
    })
    describe("Deploy the contract", async()=>{
        it("Contract deployed Successfully",async()=>{
            const address = contract.address;
            assert.notEqual(address, "");
            assert.notEqual(address, "0x0");
            assert.notEqual(address, null);
            assert.notEqual(address, undefined);

        })

        it("Valid Name",async()=>{
            const name = await contract.name();
            assert.equal(name, "Alyafie361", "The name is correct");

        })
        it("Valid Symbol",async()=>{
            const symbol = await contract.symbol();
            assert.equal(symbol, "AL", "The name is correct");

        })
    })

    describe("Mint Check Test", async()=>{
        it("Create NFT Token",async()=>{
            const mint = await contract.mint("https://vaxina.com");
            const tot = await contract.totalSupply();
            console.log(mint.logs[0]);

            const eve = mint.logs[0].args;
            assert.equal(eve.to,accounts[0]);
            assert.equal(tot, 1);
        })

    })

    describe("Search for NFT", async()=>{
        it("Create NFT Token",async()=>{
            await contract.mint("https://vaxina.com/2");
            await contract.mint("https://vaxina.com/3");
            await contract.mint("https://vaxina.com/4");
            await contract.mint("https://vaxina.com/5");
            const tott = await contract.totalSupply();
            console.log(tott);
            assert.equal(tott, 5);

            let nfttokens = [];
            let nftt;
            for(i=0; i<tott; i++){
                nftt = await contract.nftTokens(i);
                nfttokens.push(nftt);
            }
            console.log(nfttokens);
            
            let myArray = [
                'https://vaxina.com',
                'https://vaxina.com/2',
                'https://vaxina.com/3',
                'https://vaxina.com/4',
                'https://vaxina.com/5'];

            assert.equal(nfttokens.join(","),myArray.join(","));
        })

    })

})

