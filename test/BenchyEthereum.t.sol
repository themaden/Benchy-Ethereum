// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BenchyEthereum.sol";

contract BenchyEthereumTest is Test {
    BenchyEthereum public benchyToken;
    address alice = address(1);
    address bob = address(2);
    address cassandra = address(3);
    address driss = address(4);
    address elena = address(5);

    function setUp() public {
        benchyToken = new BenchyEthereum(3000 * 10**18);
        vm.deal(alice, 10 ether);
        vm.deal(bob, 10 ether);
        vm.deal(cassandra, 10 ether);
    }

    function testInitialBalances() public view {
        assertGt(alice.balance, 0);
        assertGt(bob.balance, 0);
        assertGt(cassandra.balance, 0);
    }

    function testScenario1() public {
        vm.prank(alice);
        payable(bob).transfer(0.1 ether);
        assertEq(bob.balance, 10.1 ether);
    }

    function testScenario2() public {
        benchyToken.transfer(driss, 1000 * 10**18);
        benchyToken.transfer(elena, 1000 * 10**18);
        assertEq(benchyToken.balanceOf(driss), 1000 * 10**18);
        assertEq(benchyToken.balanceOf(elena), 1000 * 10**18);
    }

    function testScenario3() public {
        vm.prank(cassandra);
        payable(elena).transfer(1 ether);
        assertEq(elena.balance, 1 ether);
    }

    function testTemporaryFailure() public {
            vm.deal(alice, 0.5 ether);    
            vm.expectRevert();
            vm.prank(alice);
            payable(bob).transfer(1 ether);
    }
}