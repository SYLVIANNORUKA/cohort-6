// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CrowdNFT is ERC721, Ownable{
    uint256 private _tokenIds;
    uint256 public fundingThreshold = 5 ether; 
    // NFT reward threshold

    constructor() ERC721("CrowdNFT", "CNFT") {}

    function mintNFT(address to )external onlyOwner {
        uint256 newTokenId = _tokenIds;
        _safeMint(to, newTokenId);
        _tokenIds++;
    }
}