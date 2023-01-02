// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./ERC721Metadata.sol";
import "./ERC721.sol";
import "./ERC721Enumerable.sol";


contract nfts is ERC721Metadata, ERC721Enumerable{

    constructor () ERC721Metadata("Alyafie3611", "AL"){

    }

    string [] nftTokens;
    mapping(string => bool) _nftUrlExists;

    function mint(string memory _nftUrl) public {
        require(!_nftUrlExists[_nftUrl], "This NFT URL Token Already Exists");
        nftTokens.push(_nftUrl);
        uint _id = nftTokens.length - 1;
        _nftUrlExists[_nftUrl] = true;
        _mint(msg.sender, _id);

    }   
}