// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./interfaces/ERC721Interface.sol";
import "./ERC165.sol";

contract ERC721 is ERC721Interface, ERC165{

    mapping(uint256 => address) private _tokenOwners;
    //0xAa2B9Cd860d558777Edbb0c9e745b77cD43254b2 how many this address has tokens
    mapping(address => uint256) private _TokenOwnerOwened;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    constructor(){
        _registerInterface(bytes4(keccak256('balanceOf(bytes4)')^
        keccak256('ownerOf(bytes4)')
        ));
    }

    function _exists(uint256 tokenId) internal view returns(bool){
        address owner = _tokenOwners[tokenId];
        return owner != address(0);
    }

    //How many token the user has

    //token => user 
    function balanceOf(address _owner) external override view returns (uint256){
        require(_owner != address(0), "This is not Aviacble Address");
        return _TokenOwnerOwened[_owner];
    } 

    //Send the tokens to the owner
    function ownerOf(uint256 _tokenId) external override view returns (address){
        address _owner = _tokenOwners[_tokenId];
        require(_owner != address(0), "This is not Aviacble Address");
        return _owner;
    }
 
    //We use virtual in order to modify or add to the function we use this key word
    function _mint(address to, uint256 tokenId) public virtual {

        require(to != address(0), "Can't mint to Address Zero");
        require(!_exists(tokenId), "Token Already minted");

        _tokenOwners[tokenId] = to;
        _TokenOwnerOwened[to] += 1;

        emit Transfer(address(0),to,tokenId);
    }
}