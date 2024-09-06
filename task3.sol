// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Staking {
    mapping(address => uint256) public stakingBalance;
    address[] public stakers;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Stake function
    function stakeTokens() public payable {
        require(msg.value > 0, "You need to stake some ETH");
        stakingBalance[msg.sender] += msg.value;

        // Add to stakers array only if it's the first time
        if (stakingBalance[msg.sender] == msg.value) {
            stakers.push(msg.sender);
        }
    }

    // Unstake function
    function unstakeTokens() public {
        uint256 balance = stakingBalance[msg.sender];
        require(balance > 0, "You have no tokens staked");

        // Transfer the tokens back
        payable(msg.sender).transfer(balance);
        stakingBalance[msg.sender] = 0;
    }
}
