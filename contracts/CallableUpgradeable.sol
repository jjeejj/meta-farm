// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract CallableUpgradeable is OwnableUpgradeable {
    
    address public caller;

    function __Callable_init(address initialOwner) internal onlyInitializing {
        __Ownable_init(initialOwner);
    }
    modifier onlyCaller() {
        require(msg.sender == caller, "Only caller can call this function");
        _;
    }
    function setCaller(address _caller) external onlyOwner {
        caller = _caller;
    }
}