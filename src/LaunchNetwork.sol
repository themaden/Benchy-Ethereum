// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LaunchNetwork {
    address[] public nodes;
    mapping(address => bool) public isValidator;

    event NetworkLaunched(address[] nodes);
    event NodeAdded(address node);

    constructor(address[] memory _initialNodes) {
        for (uint i = 0; i < _initialNodes.length; i++) {
            nodes.push(_initialNodes[i]);
            if (i < 3) {
                isValidator[_initialNodes[i]] = true;
            }
        }
        emit NetworkLaunched(_initialNodes);
    }

    function addNode(address _node) external {
        require(nodes.length < 5, "Maximum number of nodes reached");
        nodes.push(_node);
        emit NodeAdded(_node);
    }

    function getNodes() external view returns (address[] memory) {
        return nodes;
    }

    function isNodeValidator(address _node) external view returns (bool) {
        return isValidator[_node];
    }
}