
# gu-collectable-solidity

A thin wrapper of the Open Zeppelin ERC721 contracts to allow for some custom logic for each token type. Collectables 'delegate' their token-specific logic to another contract (their Delegate) - when it can be minted, when it can be transferred etc. The 'type' of an item is denoted by its delegate id, and the delegate itself can store additional properties if necessary/desired.

Currently deployed on mainnet at: [0xF61cd246D8f179a9883129C81a74300794B16DC0](https://etherscan.io/address/0xF61cd246D8f179a9883129C81a74300794B16DC0)

| ID | Name | Delegate |
|:---|:----|:-----|
| 0 | Card Back | [0x3Ec7EBf0b71cE397da5B0433dd62557bc03bEb4e](https://etherscan.io/address/0x3Ec7EBf0b71cE397da5B0433dd62557bc03bEb4e) |

Metadata will be here: https://api.godsunchained.com/collectable/{id}.

