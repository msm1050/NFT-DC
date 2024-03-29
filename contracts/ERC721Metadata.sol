// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./interfaces/InterfaceERC721Metadata.sol";
import "./ERC165.sol";

contract ERC721Metadata is InterfaceERC721Metadata, ERC165{
string private _name;
string private _symbol;


constructor(string memory start_name, string memory start_symbol){
    _name = start_name;
    _symbol = start_symbol;

 
    _registerInterface(bytes4(keccak256('name(bytes4)')^
    keccak256('symbol(bytes4)')
    ));
}

function name() external override view returns (string memory){
    return _name;
}

function symbol() external override view returns (string memory){
    return _symbol;
}
}