// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./BaseDepositBox.sol";

contract TimeLockedDepositBox is BaseDepositBox {
    uint256 public immutable unlockTime;

    constructor(uint256 _unlockTime) {
        require(_unlockTime > block.timestamp, "Unlock time must be in future");
        unlockTime = _unlockTime;
    }

    function getSecret() public view override onlyOwner returns (string memory) {
        require(block.timestamp >= unlockTime, "Secret is time-locked");
        return super.getSecret();
    }

    function getBoxType() public pure override returns (string memory) {
        return "TIME_LOCKED_DEPOSIT_BOX";
    }
}
