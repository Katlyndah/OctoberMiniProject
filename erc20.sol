// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./interface.sol"; 

contract ERC20Token is IERC20{

    //declare variable and override interface to avoid conflict
    uint public override totalSupply;
    //declare a mapping in order to get the balanceOf
    mapping(address => uint) public override balanceOf;
    //declare nested mapping in order to add allowance
    mapping(address => mapping(address => uint)) public override allowance;

    //declare the token tech4dev, symbol and decimals
    string public name = "tech4dev";
    string public symbol = "T4D";
    uint public decimals = 18;

    //function to transfer token from owner account to recipient
    function transfer(address recipient, uint amount) external override returns(bool){
        //method #1 to deduct amount from owners balance
        balanceOf[msg.sender] -= amount;
        //method #2 to add the amount to the recepients balance
        balanceOf[recipient] += amount;

        //emit event to return true if code is executed successfully
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    //function to approve input address to spend a set number of tokens from owner address
    function approve(address spender, uint amount) external override returns(bool){
        //approve goes hand in hand with allowance
        allowance[msg.sender][spender] = amount;

        //emit Approval event to confirm the transaction and return true if code is executed successfully
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    //function to enable token transfer from owner address to approved address
    function transferFrom(address sender, address recipient, uint amount) external override returns(bool){
        //allowance to check if the sender is approved and the amount is = or lower than approved amount
        allowance[sender][msg.sender] -= amount;
        //deduct amount from sender's account
        balanceOf[sender] -= amount;
        //increase amount to recipient's acount
        balanceOf[recipient] += amount;

        //emit Transfer event to confirm the transaction return true if code is executed successfully
        emit Transfer(sender, recipient, amount);
        return true;
    }

    //function mint to allow owner to create tokens and add them to the owner account
    function mint(uint amount) public{
        //show the owner's account balance and increase by the minted amount
        balanceOf[msg.sender] += amount;
        //show totalSupply of tokens and increase by the minted amount
        totalSupply += amount;

        //emit a transfer event to confirm the transaction
        emit Transfer(address(0), msg.sender, amount);
    }

    //function burn to allow owner to destroy specified amount of tokens from owner account
    function burn(uint amount) public{
        //show the owner's account balance and reduce by the input amount
        balanceOf[msg.sender] -= amount;
        //show totalSupply of tokens and reduce by the burnt amount
        totalSupply -= amount;

        //emit a transfer event to confirm the transaction
        emit Transfer(address(0), msg.sender, amount);
    }

}