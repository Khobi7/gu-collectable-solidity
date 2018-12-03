
# gu-collectable-solidity

A thin wrapper of the Open Zeppelin ERC721 contracts to allow some custom logic for each token type. Collectables 'delegate' their token-specific logic to another contract (their Delegate) which governs the rules surrounding a particular type of collectable - when it can be minted, when it can be transferred etc. The 'type' of an item is denoted by its delegate id, and the delegate itself can store additional properties. 

Currently deployed on mainnet at: ``` ```

Metadata at: ```https://api.godsunchained.com/collectable/{id}```

