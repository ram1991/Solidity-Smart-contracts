pragma solidity ^0.4.0;

contract ProductSales {
    address owner;
    string productName = 'iphone X';
    uint value = 10 ether;
    bool productSold = false;


    function ProductSales() public payable {
        owner = msg.sender;
    }

    function buy() public payable {
        if(msg.value >= value) {
        owner.transfer(this.balance);
        owner = msg.sender;
        productSold = true;
        }
    else {
        revert();
        }
    }
}
