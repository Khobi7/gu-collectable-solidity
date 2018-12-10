pragma solidity ^0.4.24;

import "../Delegate.sol";
import "../Utils/Ownable.sol";

contract ImTokenCardBack is Delegate, Ownable {

    mapping(address => bool) public claimed;
    mapping(address => bool) public approvedSenders;
    bool public canClaim = false;

    function setCanClaim(bool can) public onlyOwner {
        canClaim = can;
    }
    
    function setApprovedSender(address _sender, bool _approved) public onlyOwner {
        approvedSenders[_sender] = _approved;
    }

    function mint(address _sender, address _to) public returns (bool) {
        require(approvedSenders[_sender], "sender must be approved");
        require(canClaim, "can't claim");
        require(!claimed[_to], "one card back per user");
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