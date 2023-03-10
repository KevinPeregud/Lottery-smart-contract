// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

// add a function to see winners

contract Lottery  {
    address public owner;
    address payable[] public players;
    uint public lotteryId;
    mapping (uint => address payable) public lotteryHistory;

    constructor() {
        owner = msg.sender;
        lotteryId = 1;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    function getPlayers()public view returns(address payable[] memory){
        return players;
    }
    function enter() public payable {
    require(msg.value > .001 ether, "Ticket price is 0.001 ether");
    require(msg.value < .0015 ether, "Ticket price is 0.001 ether");
    players.push(payable(msg.sender));
    if (address(this).balance >= 10 ether) {
        uint index = getRandomNumder() % players.length;
        players[index].transfer(address(this).balance);
    }
}


    function getRandomNumder() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
    }


    function pickWinner()  internal {
        uint index = getRandomNumder() % players.length;
        players[index].transfer(address(this).balance);

        lotteryHistory[lotteryId] = players[index];
        lotteryId++;
       


          // rest contract
    players = new address payable[](0);
  }
  
 
    modifier onlyOwner {
       require(msg.sender == owner, "Only the owner can call this function");
       _;
    }
}  
