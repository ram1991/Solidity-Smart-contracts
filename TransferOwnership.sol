pragma solidity ^0.4.18;

contract TransferOwner {
   address public owner;

   function TransferOwner() public {
       owner = msg.sender;   
   }
    
    event ChangeOwner(address indexed owner, address indexed newowner);
    
    modifier ifOwner() {
        require(owner == msg.sender);
        _;
   }
            
   function TrasferOwnership(address newOwner) ifOwner public {
    require(newOwner != address(0));
    ChangeOwner(owner, newOwner);
       owner = newOwner;
       
   }
}
