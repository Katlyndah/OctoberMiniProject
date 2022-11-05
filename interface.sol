// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20{

    //Add functions
    //Function to display total supply of tokens
    function totalSupply() external view returns(uint);
    //Function to display the balance of the address input
    function balanceOf(address account) external view returns(uint);
    //Function to transfer amount input to specified account
    function transfer(address recipient, uint amount) external returns(bool);
    //Function to allow different account address to spend funds from owner address
    function allowance(address owner, address spender) external view returns(uint);
    //Function to approve spender address and maximun amount to be spent 
    function approve(address spender, uint amount) external returns(bool);
    //Function to allow input amount to be transfered from owner to spender address by spender 
    function transferFrom(address sender, address recipient, uint amount) external returns(bool);

    //Add events
    //Add event to facilitate communication between the interface and log when transactions occur
    event Transfer(address indexed from, address indexed to, uint amount);
    //Add event to facilitate communication between the interface and log when transactions occur
    event Approval(address indexed owner, address indexed spender, uint amount);
}