// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Types {
 
    bool public boolean;
    int public integer;
    string public str;
    bytes public b;
    address public userAddress;

    constructor() {                  
        boolean= true; 
        integer = -10;  
        str = "Today is a great day"; 
        b = "a";   
    } 
     
}     