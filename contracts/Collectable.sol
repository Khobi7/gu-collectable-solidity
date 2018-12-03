pragma solidity ^0.4.24;

contract Collectable {

    function mint(uint32 delegateID, address to) public;

    function transferFrom(address from, address to, uint256 tokenId) public;
    function approve(address to, uint256 tokenId) public;
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public;

    function safeTransferFrom(address from, address to, uint256 tokenId) public;

}