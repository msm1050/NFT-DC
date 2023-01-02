// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/// @title ERC-721 Non-Fungible Token Standard
/// @dev See https://eips.ethereum.org/EIPS/eip-721
///  Note: the ERC-165 identifier for this interface is 0x80ac58cd.
interface ERC721Interface /* is ERC165 */ {
    
    //event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    function balanceOf(address _owner) external view returns (uint256);

    function ownerOf(uint256 _tokenId) external view returns (address);

  
}
