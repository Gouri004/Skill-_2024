// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract UserAddress {
    address public userAddress;

    function setUserAddress() public {
        require(msg.sender != address(0), "Invalid sender");
        userAddress = msg.sender;
    }

    function getUserAddress() public view returns (address) {
        return userAddress;
    }

}