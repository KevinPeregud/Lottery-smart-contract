# Lottery-smart-contract
Solidity Lottery smart contract with pay winner when balance reaches set amount
This smart contract automatically pays out a random winner when the balance is equal to or greater than 10 ether.
Random winner is choosen by keccak256(abi.encodePacked(owner, block.timestamp) 
*****NOT SAFE FOR DEPLOY TO MAIN NET!!! RANDOM WINNER CAN BE PREDICTED !!!****
Use ChainLink Oricale to pick "Random Winner". 
