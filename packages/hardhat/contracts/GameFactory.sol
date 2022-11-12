// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "./Game.sol";
import "hardhat/console.sol";

contract GameFactory {
    address[] public allGames;
    uint256[] private nextCoordinates;
    uint256 public constant NUM_MINES = 10;

    constructor(address game, uint256[] memory _coordinates){
        console.log("constructor starts");
        // Manually initializing the first game 
        //First 2 games will use the same coordinates for simplicity
        handleCoordinates(_coordinates);
        // Game game = new Game(nextCoordinates);
        allGames.push(game);
    }

    function startNewGame(uint256[] memory coordinates) public returns (address){
        // Initialize game using previous coordinates
        Game nextGame = new Game(nextCoordinates);
        handleCoordinates(coordinates);
        allGames.push(address(nextGame));
        return address(nextGame);
    }

    function handleCoordinates(uint256[] memory coordinates) internal {
        console.log("we get to here??");
        require(coordinates.length == NUM_MINES*2, "Game : Incorrect number of mines generated");
        nextCoordinates = new uint256[](coordinates.length);
        for(uint8 i = 0; i < coordinates.length; i++){
            // limit the max number to be 80
            nextCoordinates[i] = coordinates[i];
            console.log("iteration number",nextCoordinates[i]);
        }
        console.log("loop complete");
        // return nextCoordinates;
    }
}
