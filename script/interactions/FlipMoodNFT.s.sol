// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNFT} from "../../src/MoodNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract FlipMoodNFT is Script {
    function run() public {
        uint256 tokenId = vm.envUint("TOKEN_ID");
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNFT", block.chainid);
        flipNftOnContract(mostRecentlyDeployed, tokenId);
    }

    function flipNftOnContract(address contractAddress, uint256 tokenId) public {
        MoodNFT moodNft = MoodNFT(contractAddress);
        if (moodNft.ownerOf(tokenId) != msg.sender) {
            revert("Only the onwer of the NFT can flip the mood");
        }

        vm.startBroadcast();
        MoodNFT(contractAddress).flipMood(tokenId);
        vm.stopBroadcast();
    }
}
