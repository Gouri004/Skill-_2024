// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TimeLockedContract {
    // Mapping of user addresses to their deposits
    mapping (address => uint256) public deposits;

    // Mapping of user addresses to their deposit timestamps
    mapping (address => uint256) public depositTimestamps;

    // Waiting period in seconds
    uint256 public waitingPeriod;

    // Constructor
    constructor(uint256 _waitingPeriod)  {
        waitingPeriod = _waitingPeriod;
    }

    // Deposit funds
    function deposit() public payable {
        // Update deposit amount and timestamp for the user
        deposits[msg.sender] += msg.value;
        depositTimestamps[msg.sender] = block.timestamp;
    }

    // Withdraw funds
    function withdraw() public {
        // Check if the waiting period has passed
        require(block.timestamp >= depositTimestamps[msg.sender] + waitingPeriod, "Waiting period has not passed yet");

        // Transfer funds back to the user
        uint256 amount = deposits[msg.sender];
        deposits[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}