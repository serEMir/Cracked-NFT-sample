// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNFT} from "../../src/MoodNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintMoodNFT is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNFT", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNFT(contractAddress).mintNft();
        vm.stopBroadcast();
    }
}
