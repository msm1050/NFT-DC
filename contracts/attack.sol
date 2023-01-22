// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Suicidal {
    address owner;
    function suicide() public returns (address) {
        require(owner == msg.sender);
        selfdestruct(owner);
    }
}

contract C is Suicidal {
    address owner;
    function C() {
        owner = msg.sender;
    }
}

function changeOwner_fixed(address _newOwner)
        public 
        onlyowner 
    {
        owner = _newOwner;
    }

