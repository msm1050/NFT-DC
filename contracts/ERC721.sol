// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ERC721{


    mapping(uint256 => address) private _tokenOwners;
    //0xAa2B9Cd860d558777Edbb0c9e745b77cD43254b2 how many this address has tokens
    mapping(address => uint256) private _TokenOwnerOwened;

    event Transfare(address indexed from, address indexed to, uint256 indexed tokenId);

    function _exists(uint256 tokenId) internal view returns(bool){
        address owner = _tokenOwners[tokenId];
        return owner != address(0);
    }

    //How many token the user has

    //token => user 
    function balanceOf(address _owner) external view returns (uint256){
        require(_owner != address(0), "This is not Aviacble Address");
        return _TokenOwnerOwened[_owner];
    } 

    //Send the tokens to the owner
    function ownerOf(uint256 _tokenId) external view returns (address){
        address _owner = _tokenOwners[_tokenId];
        require(_owner != address(0), "This is not Aviacble Address");
        return _owner;
    }
 

    function _mint(address to, uint256 tokenId) public {

        require(to != address(0), "Can't mint to Address Zero");
        require(!_exists(tokenId), "Token Already minted");

        _tokenOwners[tokenId] = to;
        _TokenOwnerOwened[to] += 1;

        emit Transfare(address(0),to,tokenId);
    }
}