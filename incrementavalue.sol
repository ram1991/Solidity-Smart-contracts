pragma solidity ^0.4.18;
contract IncrementValue {
    address owner;
    uint variable;
    
    function IncrementValue() public {
        owner = msg.sender;
        variable = 10;
    }
    function increment() public {
       variable += 1;
    }
    function getIncrementedValue() public constant returns(uint) {
        return variable;
    }
    function kill() public {
        if(msg.sender == owner) 
        selfdestruct(owner);
        }
}
