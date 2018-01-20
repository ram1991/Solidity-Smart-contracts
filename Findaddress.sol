pragma solidity ^0.4.0;


contract MyFirstContract {
    address owner;
    
    function MyFirstContract() {
        owner = msg.sender;
    }
    
    function getOwnerAddress() public constant returns(address) {
        return owner;
    }
    
     function kill() public {
        if(msg.sender == owner) 
            suicide(msg.sender);
    }
}
