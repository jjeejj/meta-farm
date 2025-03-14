// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Callable is Ownable {
    address public caller;

    constructor(address initialOwner) Ownable(initialOwner){}

    modifier onlyCaller() {
        require(msg.sender == caller, "Only caller can call this function");
        _;
    }

    function setCaller(address _caller) external onlyOwner {
        require(_caller != address(0), "Invalid caller address");
        caller = _caller;
    }
}