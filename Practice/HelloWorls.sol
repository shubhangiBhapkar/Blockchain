pragma solidity ^0.8.0;

contract HelloWorld{
    string public message = "hello,Blockchain";

    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}