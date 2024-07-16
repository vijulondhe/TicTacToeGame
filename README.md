# TicTacToeGame

This project is a smart contract implementation of a Tic Tac Toe game written in Solidity.

## Description

The TicTacToeGame contract allows two players to play the classic Tic Tac Toe game on the Ethereum blockchain. The contract manages the game state, enforces the rules, and determines the winner.

## Features

- Two-player game
- Enforces the rules of Tic Tac Toe
- Determines the winner or if the game is a draw
- Resets the game for a new round

## Getting Started

### Prerequisites

- Node.js
- npm
- Truffle
- Ganache

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/TicTacToeGame.git
   cd TicTacToeGame
   
2. Install Dependencies:
   npm install
   
3. Compile the Smart Contract:
   truffle compile

4. Deploy the Smart Contract:
   Start Ganache:
	ganache-cli
   
   In another terminal, deploy the contract:
    migrate
Usage
1. Interact with the Contract:
   Use Truffle console to interact with the deployed contract:
	truffle console
2. Play the Game:
   Instantiate the contract:
	let ticTacToe = await TicTacToeGame.deployed();
	
	Start a new game and make moves by calling the contract functions.

License
This project is licensed under the MIT License - see the LICENSE file for details.

   

