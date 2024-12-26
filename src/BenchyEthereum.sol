// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract BenchyEthereum is ERC20 {
    constructor(uint256 initialSupply) ERC20("BY Token", "BY") {
        _mint(msg.sender, initialSupply);
    }

    function someFunctionThatShouldRevert() public pure {
        require(false, "This function should always revert");
    }
}

