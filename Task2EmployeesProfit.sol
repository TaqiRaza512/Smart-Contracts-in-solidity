//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.7;
contract HR
{
    address public HRAddress;
    address payable public Employee1;
    address payable public Employee2;
    address payable public Employee3;
    address payable public Employee4;
    constructor(address payable adrs1,address payable adrs2,address payable adrs3,address payable adrs4)
    {
        HRAddress=msg.sender;
        Employee1=adrs1;
        Employee2=adrs2;
        Employee3=adrs3;
        Employee4=adrs4;
    }
    function Balance(address Employee)public view returns (uint)
    {
        return Employee.balance;
    }
    function GetBalance()public view returns (uint)
    {
        return address(this).balance;
    }
    function HRAdd()public view returns (address)
    {
        return address(this);
    }
    function Deposit() public payable OnlyHR
    {
        uint256 amountDeposited=address(this).balance;
        Employee1.transfer(amountDeposited*1/2); 
        Employee2.transfer(amountDeposited*1/4);
        Employee3.transfer(amountDeposited*3/20); 
        Employee4.transfer(amountDeposited*1/10); 
    }
    modifier OnlyHR()
    {
        require(msg.sender==HRAddress,"Only HR can deposit the salaries to employees");
        _;
    } 
}