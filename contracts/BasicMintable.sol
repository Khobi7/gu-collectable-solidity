pragma solidity ^0.4.24;

import "./Delegate.sol";
import "./Utils/Ownable.sol";

contract BasicMintable is Delegate, Ownable {

    mapping(address => bool) public minters;

    function setCanMint(address minter, bool canMint) public onlyOwner {
        minters[minter] = canMint;
    }

    bool public canAnyMint = true;

    function setCanAnyMint(bool canMint) public onlyOwner {
        canAnyMint = canMint;
    }

    function mint(address _sender, address) public returns (bool) {
        require(canAnyMint, "no minting possible");
        return minters[_sender];
    }

    function approve(address, address, uint256) public returns (bool) {
        return true;
    }

    function setApprovalForAll(address, address, bool) public returns (bool) {
        return true;
    }

    function transferFrom(address, address, address, uint256) public returns (bool) {
        return true;
    }
    
    function safeTransferFrom(address, address, address, uint256) public returns (bool) {
        return true;
    }

    function safeTransferFrom(address, address, address, uint256, bytes memory) public returns (bool) {
        return true;
    }

}