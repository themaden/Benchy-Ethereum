// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TemporaryFailureCommand {
    mapping(address => bool) public isNodeOffline;
    
    event NodeOffline(address node);
    event NodeOnline(address node);

    function simulateTemporaryFailure(address _node) external {
        require(!isNodeOffline[_node], "Node is already offline");
        isNodeOffline[_node] = true;
        emit NodeOffline(_node);
    }

    function bringNodeBackOnline(address _node) external {
        require(isNodeOffline[_node], "Node is not offline");
        isNodeOffline[_node] = false;
        emit NodeOnline(_node);
    }

    function isNodeDown(address _node) external view returns (bool) {
        return isNodeOffline[_node];
    }
}