//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.7;

contract BuyerAndSellerParta
{
    address payable public Seller;
    address payable public Buyer;
    bool MessagePublished=false;
    uint public PriceOfProduct=0;
    bool has_Shipped=false;
    constructor(address payable _Seller,address payable _Buyer)
    {
        Seller=_Seller;
        Buyer=_Buyer;
    }
    function PublishAdvertisement(uint Price) public 
    {
        require(msg.sender==Seller,"Only Seller can publish the product advertisement");
        require(MessagePublished==false,"Advertisement has already published");
        PriceOfProduct=Price;
        MessagePublished=true;
    }
    function BuyTheProduct() payable public 
    {
        require(msg.sender==Buyer,"Only Buyer can Buy the Product");
        require(MessagePublished==true,"Seller don't have any product to sale");
        require(address(this).balance==PriceOfProduct,"Buyer's entering Funds must be equal to the Price of Product");
        has_Shipped=true;
    }
    function ReceiveTheProductConfirmation() public
    {
        require(msg.sender==Buyer,"Only Buyer can confirm that he have Received The product");
        require(has_Shipped==true,"Product has not been shipped");
        Seller.transfer(address(this).balance);
    }     
}