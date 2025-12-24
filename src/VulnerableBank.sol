// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract VulnerableBank {
    mapping(address => uint256) public balance;

    function depositEth() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdrawEth() public {
    require(balance[msg.sender] > 0, "Balance is empty");
    (bool success, ) = msg.sender.call{value: balance[msg.sender]}("");  // ← SENDS ETH
    balance[msg.sender] = 0;  // ← UPDATES BALANCE AFTER
    require(success, "Transfer failed.");
    }
}