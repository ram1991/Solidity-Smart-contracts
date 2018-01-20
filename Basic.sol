pragma solidity ^0.4.18;

contract Basic {
    
    address owner;
    
    function Basic () {
    owner = msg.sender;
    
    }
    
    function getMinersAddress() constant returns(address){
        return block.coinbase;
    }
    function getCurrentBlockDifficulty() constant returns(uint){
        return block.difficulty;
    }
    function getCurrentBlockGasLimit() constant returns(uint){
        return block.gaslimit;
    }
    function getCurrentBlockNumber() constant returns(uint){
        return block.number;
    }
    function getCurrentBlockTimeStamp() constant returns(uint){
        return block.timestamp;
    }
    function getMessageData() constant returns(bytes){
        return msg.data;
    }
    function getOwnerAddress() constant returns(address){
        return msg.sender;
    }
    function getMessageValue() constant returns(uint){
        return msg.value;
    }
    function getCurrentTimeStamp() constant returns(uint){
        return now;
    }
     function getTransactionGasPrice() constant returns(uint){
        return tx.gasprice;
     }
     function getTransactionOrigin() constant returns(address){
        return tx.origin;
     }
     function getCurrentAddress() constant returns(address){
        return this;
     }
     function getCurrentBlance() constant returns(uint){
        return this.balance;
     }
     
     function kill() {
     if(msg.sender == owner)
     selfdestruct(owner);
     }
}
     
