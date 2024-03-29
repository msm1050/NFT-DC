// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./ERC721.sol";
import "./interfaces/InterfaceERC721Enumerable.sol";
//import "./ERC165.sol";

contract ERC721Enumerable is ERC721, InterfaceERC721Enumerable{
    //TO Do the other interface function
    uint256 [] private _allTokens;
    mapping(address => uint256[]) private _owenedTokens;
    mapping(uint256 => uint256) private _allTokensByIndex;
    mapping(uint256 => uint256) private _owenedTokensIndex;

    constructor(){
        _registerInterface(bytes4(keccak256('totalSupply(bytes4)')^
        keccak256('tokenByIndex(bytes4)')^
        keccak256('tokenOfOwnerByIndex(bytes4)')
        ));
    }

    function tokenByIndex(uint256 index) public override view returns(uint256){
        require(index < totalSupply(), "");
        return _allTokens[index];
    }
     
    function _mint(address to, uint256 tokenId) public override (ERC721){
        super._mint(to, tokenId);
        _addtokenToTotalSupply(tokenId);
        _addTokenToTheOwners(to, tokenId);
    }

    function _addtokenToTotalSupply (uint256 tokenId) private {
        _allTokensByIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    function totalSupply() public override view returns (uint256) {
        return _allTokens.length;
    }

    function tokenOfOwnerByIndex(address owner, uint256 index) public override view returns (uint256) {
        return _owenedTokens[owner][index];
    }

    function _addTokenToTheOwners(address to, uint256 tokenId) private {
        _owenedTokensIndex[tokenId] = _owenedTokens[to].length;
        _owenedTokens[to].push(tokenId);
    }


}
