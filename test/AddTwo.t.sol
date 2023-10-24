// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.19;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

interface AddTwo {
  function addTwo(uint256, uint256) external returns (uint256);
}

contract AddTwoTest is Test {
    AddTwo public addTwoContract;

    function setUp() public {
        addTwoContract = AddTwo(HuffDeployer.deploy("AddTwo"));
    }

    function testAddTwo(uint64 a, uint64 b) public {
        uint256 sum = addTwoContract.addTwo(uint256(a), uint256(b));
        console.log(sum);
        assertEq(sum, a + b);
    }
}