//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.7;

contract MarketPlace
{
    uint public balance=0;
    bool TaskDone=false;

    address payable public Client;
    address payable public Tasker;

    constructor(address payable _Client,address payable _Tasker)
    {
        Client=_Client;
        Tasker=_Tasker;
    }
    function GetHomeService()public payable
    {
        require(msg.sender==Client,"Only Client can get Home Services");
        require(balance==0,"Client had already requested the Service");
        require(address(this).balance!=0,"Contract cannot be made with 0 value");
        balance=address(this).balance;
    }
    function TaskDoneByTasker() public 
    {
        require(msg.sender==Tasker,"Only Tasker can make sure that Task is done");
        TaskDone=true;
    }
    function TaskToApprove()public
    {
        require(msg.sender==Client,"Only Client can approve the task done by tasker");
        require(TaskDone==true,"Task is not completed yet");
        Tasker.transfer(address(this).balance);
        balance=0;
        TaskDone=false;
    }
    function getBalance() public view returns (uint)
    {
        return address(this).balance;
    }
}