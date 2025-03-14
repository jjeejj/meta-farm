// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./libraries/NFTTypes.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "./CallableUpgradeable.sol";

error NFTNotExist();
error NFTNotActive();
error NFTLevelExceeded();

event NFTMinted(address indexed recipient, uint256 indexed tokenId, NFTTypes.NFTType nftType, uint256 level);
event NFTUpgraded(uint256 indexed tokenId, uint256 newLevel);
event NFTStatusChanged(uint256 indexed tokenId, bool status);

contract FarmNFT is ERC721URIStorageUpgradeable, UUPSUpgradeable, CallableUpgradeable {
   uint256 private _tokenId;

    // 每个用户的 用户的  token 列表
   mapping(address => uint256[]) private _ownedTokens;

   function initialize() public initializer {
        __ERC721_init("FarmNFT", "FNFT");
        __UUPSUpgradeable_init();
        __Callable_init(msg.sender);
   }
}