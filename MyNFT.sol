
// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;



import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title MyNFT contract 
/// @notice This contract allows minting of unique NFTs and setting their metadata . Only the owner can butn nfts.
/// @devs This contract uses OpenZeppelin's ERC721URIStorage and Ownable extensions for simplified NFT creation and access control.
contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    /// @notice Counter for tracking the next token ID to be minted.
    Counters.Counter private _tokenIds;

    /// @notice Constructor to initialize the ERc721 token with a name and a symbol.
    /// @dev The contract initializes using the parent ERC721 constructor with the token name 'MyNFT' and symbol 'NFT' . 
    constructor() public ERC721("MyNFT", "NFT") {}

    /// @notice Mints a new NFT and assigns it to the specified recipient.
    /// @dev Only the contract owner can call this function. It increments the token ID counter , mints the NFT and sets the token URI
    /// @param recipient The address to receive the newly minted nft.
    /// @param tokenURI The URI pointing to the metadata of the nft.
    function mintNFT(address recipient, string memory tokenURI)
        public  returns (uint256)
    {
        /// @notice Increments the toeknID counter to get the next available token ID . 
        _tokenIds.increment();

        /// @dev Get the new token ID from the counter.
        uint256 newItemId = _tokenIds.current();
        /// @dev Mints a new toekn and assign it to the recipient 's address.
        _mint(recipient, newItemId);
        /// @dev Sets the token URI for the newly minted token . 
        _setTokenURI(newItemId, tokenURI);

        /// @return the new token ID .  
        return newItemId;
    }
}
