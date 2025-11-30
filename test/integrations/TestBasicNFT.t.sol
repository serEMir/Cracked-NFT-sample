// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNFT} from "../../script/DeployBasicNFT.s.sol";
import {BasicNFT} from "../../src/BasicNFT.sol";
import {MintBasicNFT} from "../../script/interactions/BasicNFTInteractions.s.sol";

contract TestBasicNFT is Test {
    DeployBasicNFT public deployer;
    BasicNFT public basicNFT;
    // MintBasicNFT public minter;
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    address public USER = makeAddr("user");

    function setUp() external {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
        // minter = new MintBasicNFT();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Super Doggies";
        string memory actualName = basicNFT.name();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testcanMintandHaveABalance() public {
        vm.prank(USER);
        basicNFT.mintNft(PUG);

        assert(basicNFT.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNFT.tokenURI(0))));
    }

    function testMinterCanMint() public {
        uint256 startingTokenCount = basicNFT.getTokenCounter();
        MintBasicNFT minter = new MintBasicNFT();
        address mostRecentlyDeployed = address(basicNFT);
        minter.mintNftOnContract(mostRecentlyDeployed);
        assert(basicNFT.getTokenCounter() == startingTokenCount + 1);
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNFT.tokenURI(0))));
    }
}