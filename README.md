
# gu-collectable-solidity

A thin wrapper of the Open Zeppelin ERC721 contracts to allow for some custom logic for each token type. Collectables 'delegate' their token-specific logic to another contract (their Delegate) - when it can be minted, when it can be transferred etc. The 'type' of an item is denoted by its delegate id, and the delegate itself can store additional properties if necessary/desired.

Currently deployed on mainnet at: [0x](https://etherscan.io/address/0x7910254cee5cb6bdcefd9b8ece1d0e59b6daa1d7)

| ID | Name | Delegate |
|:---|:----|:-----|
| 1 | Card Back | [0x](https://etherscan.io/address/0xa5cd1351d9d12ef29136e23ca2dd3b35faf2c257) |

Metadata will be here: https://api.godsunchained.com/collectable/{id}.

