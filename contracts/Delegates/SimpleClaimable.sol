pragma solidity ^0.4.24;

import "../Delegate.sol";
import "../Utils/Ownable.sol";

contract SimpleClaimable is Delegate, Ownable {

    mapping(address => bool) public claimed;
    bool public canClaim = false;

    function setCanClaim(bool can) public onlyOwner {
        canClaim = can;
    }

    function mint(address _sender, address _to) public returns (bool) {
        require(_to.balance >= 0.5 ether, "must have at least 0.5 eth in account");
        require(_sender == _to, "can only claim for yourself");
        require(canClaim, "can't claim");
        require(!claimed[_to], "already claimed");
        claimed[_to] = true;
        return true;
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