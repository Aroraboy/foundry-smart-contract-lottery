// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {VRFV2PlusClient} from "@chainlink/contracts/src/v0.8/vrf/dev/libraries/VRFV2PlusClient.sol";

contract MockVRFCoordinator {
    event RequestRandomWordsCalled(VRFV2PlusClient.RandomWordsRequest request);

    error InvalidRequest(uint256, address);

    function requestRandomWords(
        VRFV2PlusClient.RandomWordsRequest memory request
    ) external returns (uint256) {
        emit RequestRandomWordsCalled(request);
        return 1; // dummy requestId
    }

    function fulfillRandomWords(uint256, address) external pure {
        revert InvalidRequest(0, address(0));
    }
}
