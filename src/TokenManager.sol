// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TokenManager {
    mapping(address => uint256) public balances;

    function mintTokens() public {
        balances[msg.sender] += 100;
    }

    function transferTokens(address _recipient, uint256 _amount) public {
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }
}
