// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniTwitter {
    struct Tweet {
        string content;
        uint256 timestamp;
    }

    mapping(address => Tweet[]) public tweets;
    address public owner;
    uint16 public MAX_TWEET_LENGTH = 280; // default max length

    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access
    modifier onlyOwner() {
        require(msg.sender == owner, "YOU ARE NOT THE OWNER!");
        _;
    }

    // Function to post a tweet
    function postTweet(string memory _content) public {
        require(bytes(_content).length <= MAX_TWEET_LENGTH, "Tweet too long!");
        tweets[msg.sender].push(Tweet(_content, block.timestamp));
    }

    // Function to change max tweet length (only owner can do this)
    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    // Get tweet count for a user
    function getTweetCount(address user) public view returns (uint256) {
        return tweets[user].length;
    }

    // Get a specific tweet
    function getTweet(address user, uint256 index) public view returns (string memory, uint256) {
        require(index < tweets[user].length, "Invalid tweet index!");
        Tweet memory t = tweets[user][index];
        return (t.content, t.timestamp);
    }
}
