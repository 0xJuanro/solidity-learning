// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SecureBank {
    mapping(address => uint256) public balance;

    function depositEth() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdrawEth() public {
        require(balance[msg.sender] > 0, "Balance is empty");
        uint256 amount = balance[msg.sender];
        (bool success, ) = msg.sender.call{value: amount}("");
        balance[msg.sender] = 0;
        require(success, "Transfer failed.");
    }

}