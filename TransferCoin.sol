pragma solidity ^0.4.18;
contract SampleCoin {
    mapping (address => uint) balances;

    function SampleCoin() public {
        balances[msg.sender] = 10;
    }

    function transferCoin(address receiverAddress, uint amount) public returns(bool) {
        if(balances[msg.sender] < amount)  return false; 
        balances[msg.sender] -= amount;
        balances[receiverAddress] += amount;
        return true;
    }
}


