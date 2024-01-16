//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./Helper.sol";

contract Good {
    Helper helper;

    constructor(address _helper) payable {
        helper = Helper(_helper);
    }

    function isUserEligible() public view returns (bool) {
        return helper.isUserEligible(msg.sender);
    }

    function addrUserTolist() public {
        helper.setUserEligble(msg.sender);
    }

    fallback() external {}
}