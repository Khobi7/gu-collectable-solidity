pragma solidity ^0.4.24;

import "./Zeppelin/ERC721Full.sol";
import "./Utils/Ownable.sol";
import "./Delegate.sol";
import "./Utils/Strings.sol";

contract Collectables is ERC721Full("GU Collectable", "TRINKET"), Ownable {

    using Strings for string;

    // delegate item specific storage/logic to other contracts
    // one main contract manages transfers etc
    mapping(uint32 => address) public delegates;

    // use uint32s instead of addresses to reduce the storage size needed
    // individual token properties should be stored in the delegate contract
    uint32[] public collectables;
    uint public delegateCount;

    event DelegateAdded(address indexed delegate, uint32 indexed delegateID);

    function addDelegate(address delegate) public onlyOwner {
        uint32 delegateID = uint32(delegateCount++);
        require(delegates[delegateID] == address(0), "delegate is already set for collectable type");
        delegates[delegateID] = delegate;
        emit DelegateAdded(delegate, delegateID);
    }

    function mint(uint32 delegateID, address to) public {
        Delegate delegate = getDelegate(delegateID);
        require(delegate.mint(msg.sender, to), "delegate could not mint token");
        uint id = collectables.push(delegateID) - 1;
        super._mint(to, id);
    }

    function transferFrom(address from, address to, uint256 tokenId) public {
        Delegate delegate = getTokenDelegate(tokenId);
        require(delegate.transferFrom(msg.sender, from, to, tokenId), "could not transfer token");
        super.transferFrom(from, to, tokenId);
    }

    function approve(address to, uint256 tokenId) public {
        Delegate delegate = getTokenDelegate(tokenId);
        require(delegate.approve(msg.sender, to, tokenId), "could not approve token");
        super.approve(to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes data) public {
        Delegate delegate = getTokenDelegate(tokenId);
        require(delegate.safeTransferFrom(msg.sender, from, to, tokenId, data), "could not safe transfer token");
        super.safeTransferFrom(from, to, tokenId, data);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public {
        Delegate delegate = getTokenDelegate(tokenId);
        require(delegate.safeTransferFrom(msg.sender, from, to, tokenId), "could not safe transfer token");
        super.safeTransferFrom(from, to, tokenId);
    }

    function getTokenDelegate(uint id) public view returns (Delegate) {
        address d = delegates[collectables[id]];
        require(d != address(0), "invalid delegate");
        return Delegate(d);
    }

    function getDelegate(uint32 id) public view returns (Delegate) {
        address d = delegates[id];
        require(d != address(0), "invalid delegate");
        return Delegate(d);
    }

    string public constant tokenMetadataBaseURI = "https://api.godsunchained.com/collectable/";

    function tokenURI(uint256 _tokenId) public view returns (string memory) {
        require(_exists(_tokenId), "token doesn't exist");
        return Strings.strConcat(
            tokenMetadataBaseURI,
            Strings.uint2str(_tokenId)
        );
    }

    

}