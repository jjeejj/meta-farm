// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Callable.sol";

contract FarmToken is ERC20, Callable {

    // 定义代币的初始供应量 10亿
    uint256 private constant INITAL_TOKEN_SUPPLY = 1_000_000_000 *10 ** 18;

    constructor() ERC20("Meta Farm Token", "MFT") Callable(msg.sender){
        _mint(msg.sender, INITAL_TOKEN_SUPPLY);
    }

    // 指定地址铸造代币
    function mint(address to, uint256 amount)  public onlyCaller () {
        _mint(to, amount);
    }

    // 指定地址销毁代币
    function burn(address from ,uint256 amount) public onlyCaller{
        _burn(from, amount);
    }
}