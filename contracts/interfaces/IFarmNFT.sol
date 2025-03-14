// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../libraries/NFTTypes.sol";

interface IFarmNFT {
    // 铸造 nft ,返回 nft 的 tokenId
    function mint(address recient, string memory tokenURI, NFTTypes.NFTType nftType) external returns (uint256);
    function upgrade(uint256 tokenId) external;
    function setNftStatus(uint256 tokenId, bool status) external;
    function getNftAttributes(uint256 tokenId) external view returns (NFTTypes.NFTAttributes memory);
    function ownerOf(uint256 tokenId) external view returns (address);
    function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256);
    function getNftsByOwner(address owner) external view returns (NFTTypeInfo[] memory);
    function getNftsByType(address owner, NFTTypes.NFTType nftType) external view returns (NFTTypeInfo[] memory);
}