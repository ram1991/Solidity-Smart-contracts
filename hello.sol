pragma solidity ^0.4.18;

contract SayHello {
    string word;
    function SayHello() public {
        word = 'Welcome to Solidity Smart Contracts';
    }

    function Message() public constant returns(string) {
        return word;
    }
}
