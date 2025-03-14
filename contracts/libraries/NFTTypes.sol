// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

library NFTTypes {
    // NFT类型 枚举
    enum NFTType {
        LAND, // 土地
        CROP, // 作物
        TOOL // 工具
    }

    // NFT 通用属性
    struct NFTAttributes {
        NFTType nftType;
        uint256 level;
        uint256 createdTime;
        bool isActive;
        address owner;
    }
}

// nft 对应的 token 信息
struct TokenInfo {
    uint256 tokenId;
    uint256 level;
}

// NFT 信息, 每种类型的 nft 有多少个
struct NFTTypeInfo {
    NFTTypes.NFTType nftType;
    TokenInfo[] tokenInfos;
    uint256 count;
}