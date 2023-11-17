// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Simple{
  address public Alice;
  uint256 public balance;
  uint public depositDate;

  constructor(){
    Alice=msg.sender;
  }

  receive() payable external{
    balance+=msg.value;
  }

  function withdraw(uint amount, address payable Bob) payable public{
    require(amount<=balance, "Not enough balance to withdraw!");
    Bob.transfer(amount);
    balance-=amount;
  }
}
