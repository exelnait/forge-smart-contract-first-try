// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/Contract.sol";

contract CounterTest is Test {
    Contract number;
    
    function setUp() public {
       number = new Contract(10);
    }

    function testIncrement() public {
        uint contractNum = number.getNum();
        number.increment();
        assertEq(contractNum + 1, number.getNum());
    }
    function testDecrement(uint num) public {
        vm.assume(num < number.getNum()); // say vm to use only some type of numbers
        uint contractNum = number.getNum();
        number.decrement(num);
        assertEq(contractNum - num, number.getNum());
    }
    function testFailDecrement(uint num) public { // forge will expect error in this test
        vm.assume(num > number.getNum());
        number.decrement(num);
    }

    // forge test -vvvv --match-test testCannotDecrementLargerNumbers - to debug single test
    function testCannotDecrementLargerNumbers(uint num) public {
        vm.assume(num > number.getNum());
        uint contractNum = number.getNum();
        vm.expectRevert(stdError.arithmeticError);  // say vm to wait for "revert" and not "return"
        number.decrement(num);
    }
}
