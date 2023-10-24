// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.19;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

interface SimpleStorage {
  function setValue(uint256) external;
  function getValue() external returns (uint256);
}

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        simpleStorage = SimpleStorage(HuffDeployer.deploy("SimpleStorage"));
    }

    function testSetAndGetValue(uint256 value) public {
        simpleStorage.setValue(value);
        console.log(value);
        console.log(simpleStorage.getValue());
        assertEq(value, simpleStorage.getValue());
    }
}