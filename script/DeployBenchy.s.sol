// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/BenchyEthereum.sol";

contract DeployBenchy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        new BenchyEthereum(3000 * 10**18);

        vm.stopBroadcast();
    }
}