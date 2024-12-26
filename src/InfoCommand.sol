// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract InfoCommand {
    struct NodeInfo {
        uint256 latestBlock;
        address[] peers;
        uint256 mempoolTransactions;
        uint256 cpuUsage;
        uint256 memoryUsage;
        address ethereumAddress;
        uint256 balance;
    }

    mapping(address => NodeInfo) public nodeInfos;

    function updateNodeInfo(
        address _node,
        uint256 _latestBlock,
        address[] memory _peers,
        uint256 _mempoolTransactions,
        uint256 _cpuUsage,
        uint256 _memoryUsage,
        uint256 _balance
    ) external {
        NodeInfo storage info = nodeInfos[_node];
        info.latestBlock = _latestBlock;
        info.peers = _peers;
        info.mempoolTransactions = _mempoolTransactions;
        info.cpuUsage = _cpuUsage;
        info.memoryUsage = _memoryUsage;
        info.ethereumAddress = _node;
        info.balance = _balance;
    }

    function getNodeInfo(address _node) external view returns (NodeInfo memory) {
        return nodeInfos[_node];
    }
}