// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ERC721Metadata{
string private _name;
string private _symbol;


constructor(string memory start_name, string memory start_symbol){
    _name = start_name;
    _symbol = start_symbol;
}

function name() external view returns (string memory){
    return _name;
}

function symbol() external view returns (string memory){
    return _symbol;
}
}