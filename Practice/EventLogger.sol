pragma solidity ^0.8.0;

contract EventLogger{
    event MessageLogged(address sender,string message);

        function logMessage(string memory _message) public {
            emit MessageLogged(msg.sender, _message);
        }
}
