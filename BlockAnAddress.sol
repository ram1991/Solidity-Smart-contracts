pragma solidity ^0.4.18;
contract BlockAnAddress {
   
   struct Person {
       address addressOfPerson;
       uint numberOfTimes;
   }
    
    mapping(address => Person) public blocked;
    
    function Blocked() {        
    }
    
    function BlockPerson(address _listOfAddress) public  {
       blocked[_listOfAddress].addressOfPerson = _listOfAddress;
       blocked[_listOfAddress].numberOfTimes += 1;
    } 
}
