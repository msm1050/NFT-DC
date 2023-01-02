// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./ERC721.sol";

contract ERC721Enumerable is ERC721{
    //TO Do the other interface function
    uint256 [] private _allTokens;

    function tokenByIndex(uint256 index) public view returns(uint256){
        require(index < totalSupply(), "");
        return _allTokens[index];
    }
     
    function _mint(address to, uint256 tokenId) public override (ERC721){
        super._mint(to, tokenId);
        _addtokenToTotalSupply(tokenId);
    }

    function _addtokenToTotalSupply (uint256 tokenId) private {
        _allTokens.push(tokenId);
    }

    function totalSupply() public view returns (uint256) {
        return _allTokens.length;
    }

    mapping(address => uint256[]) private _owenedTokens;

    function tokenOfOwnerByIndex(address owner, uint256 index) public view returns (uint256) {
        return _owenedTokens[owner][index];
    }

    function _addTokenToTheOwners(address to, uint256 tokenId) private {
        _owenedTokens[to].push(tokenId);
    }


}
