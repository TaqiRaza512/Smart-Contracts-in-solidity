//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.7;
contract BuyerAndSellerPartb
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
    function PublishAdvertisement(uint Price) payable public 
    {
        require(msg.sender==Seller,"Only Seller can publish the product advertisement");
        require(address(this).balance==Price*2,"Seller has not pay the 2X of the price");
        require(MessagePublished==false,"Advertisement has already published");
        PriceOfProduct=Price;
        MessagePublished=true;
    }
    function BuyTheProduct() payable public 
    {
        require(msg.sender==Buyer,"Only Buyer can Buy the Product");
        require(address(this).balance==PriceOfProduct*4,"Buyer has not pay the 2X of the price");
        require(MessagePublished==true,"Seller don't have any product to sale");
        has_Shipped=true;
    }
    function ReceiveTheProductConfirmation() public
    {
        require(msg.sender==Buyer,"Only Buyer can confirm that he have Received The product");
        require(has_Shipped==true,"Product has not been shipped");
        require(has_Shipped==true,"Product has not been shipped");

        uint256 amountDeposited=address(this).balance;
        Seller.transfer(amountDeposited*3/4);
        Buyer.transfer(amountDeposited*1/4);

        MessagePublished=false;
        PriceOfProduct=2;
        has_Shipped=false;

    }     
}