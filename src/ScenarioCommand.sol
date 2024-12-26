// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./BenchyEthereum.sol";

contract ScenarioCommand {
    BenchyEthereum public byToken;
    address public alice;
    address public bob;
    address public cassandra;
    address public driss;
    address public elena;

    event ScenarioExecuted(uint256 scenarioId);
    event Transfer(address from, address to, uint256 amount);

    constructor(address _byToken, address _alice, address _bob, address _cassandra, address _driss, address _elena) {
        byToken = BenchyEthereum(_byToken);
        alice = _alice;
        bob = _bob;
        cassandra = _cassandra;
        driss = _driss;
        elena = _elena;
    }

    function executeScenario(uint256 _scenarioId) external {
        if (_scenarioId == 1) {
            // Alice sends 0.1 ETH to Bob every 10 seconds
            payable(bob).transfer(0.1 ether);
            emit Transfer(alice, bob, 0.1 ether);
        } else if (_scenarioId == 2) {
            // Cassandra deploys ERC20 and sends tokens to Driss and Elena
            byToken.transfer(driss, 1000 * 10**18);
            byToken.transfer(elena, 1000 * 10**18);
        } else if (_scenarioId == 3) {
            // Cassandra tries to send 1 ETH to Driss and immediately cancel
            payable(driss).transfer(1 ether);
            payable(elena).transfer(1 ether);
        }

        emit ScenarioExecuted(_scenarioId);
    }
}