// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract TicTacToeGame {
    address public _playerOne = msg.sender;
    address public _playerTwo = address(0);
    address private _lastPlayed = address(0);
    address public _winner = address(0);
    bool public _isGameOver = false;
    uint8 private _turnsTaken = 0;

    //GameBoard is a 1D array having the location indexes as 
    /*  
        0   1   2
        3   4   5
        6   7   8
    */
    
    address[9] private _gameBoard; // Represents the game board as a 1D array

    // Initializes the game with the second player's address
    function startGame(address player2) external {
        require(msg.sender == _playerOne, "Only player one can start the game.");
        require(_playerTwo == address(0), "Game has already been started.");
        _playerTwo = player2;
    }

    // Allows players to place their move on the game board
    function placeMove(uint8 index) external {
        require(index < 9, "Invalid board position.");
        require(!_isGameOver, "The game is over.");
        require(_winner == address(0), "A winner has been declared.");
        require(msg.sender == _playerOne || msg.sender == _playerTwo, "Not a participant.");
        require(_gameBoard[index] == address(0), "Position already taken.");
        require(_lastPlayed != msg.sender, "Wait for your turn.");
        
        _gameBoard[index] = msg.sender;
        _lastPlayed = msg.sender;
        _turnsTaken++;

        if (isWinner(msg.sender)) {
            _winner = msg.sender;
            _isGameOver = true;
        } else if (_turnsTaken == 9) {
            _isGameOver = true; // Game is a draw
        }
    }

    // Checks if the given player has won the game
    function isWinner(address player) private view returns(bool) {
        uint8[3][8] memory winningFilters = [
            [0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]
        ];

        for (uint i = 0; i < winningFilters.length; i++) {
            if (_gameBoard[winningFilters[i][0]] == player &&
                _gameBoard[winningFilters[i][1]] == player &&
                _gameBoard[winningFilters[i][2]] == player) {
                return true;
            }
        }
        return false;
    }

    // Provides a string representation of the current game board
    function getBoard() external view returns(string memory) {
        string memory gameBoardView = "";
        for(uint8 i = 0; i < _gameBoard.length; i++) {
            gameBoardView = string(abi.encodePacked(gameBoardView, getLocationShape(_gameBoard[i]), " "));
            if((i + 1) % 3 == 0 && i != 8) {
                gameBoardView = string(abi.encodePacked(gameBoardView, "\n"));
            }
        }
        return gameBoardView;
    }

    // Determines the symbol to display for each board position
    function getLocationShape(address addressStored) private view returns(string memory) {
        if(addressStored == address(0)) {
            return "-";
        } else if(addressStored == _playerOne) {
            return "X";
        } else {
            return "O";
        }
    }
}
