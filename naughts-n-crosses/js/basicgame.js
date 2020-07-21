

document.addEventListener('DOMContentLoaded', ()=>{

    const allCells = document.querySelectorAll('button');
    allCells.forEach( (cell) => {
        cell.addEventListener('click', makeCellSelection);
    });
});

const icon_playerOne = 'fas fa-times';
const icon_playerTwo = 'far fa-circle';

let isFirstPlayer = true;
let turnCounter = 0;
function makeCellSelection()
{
    const selectedCell = event.target;
    updatePlayingBoard(selectedCell);
    disableSelectedButton(selectedCell);
    updatePlayerSelections(selectedCell);

    turnCounter++;
    
    const banner = document.getElementById('banner'); 
    if(checkForWinner())
    {
        disableSelectedButton();            
        banner.innerText = 'WINS !!';            
    }
    else if(turnCounter === 9)
    {
        banner.previousElementSibling.setAttribute('class', 'far fa-angry');
        banner.innerText = 'DRAW';
    }
    else
    {
        switchCurrentPlayer();        
    }
}

function updatePlayingBoard(selectedCell)
{   
    const currentPlayer = document.getElementById('marker');
    const currentPlayerClass = currentPlayer.className;
    selectedCell.setAttribute('class', currentPlayerClass);    
}

function disableSelectedButton(selectedCell)
{
    if(selectedCell) 
    {                   
        selectedCell.removeEventListener('click', makeCellSelection);
    }
    else
    {                    
        const allCells = document.querySelectorAll('button');
        allCells.forEach( (cell) => {
            cell.removeEventListener('click', makeCellSelection);
        });        
    }
}

const n = 3; // represents the size of the grid --> using here to help make sense of targeted array indexes
let playerSelections = [0,0,0,0,0,0,0,0];
function updatePlayerSelections(selectedCell)
{
    const cellCoordinates = selectedCell.value;
    const cellRow = Math.floor(cellCoordinates / 10); 
    const cellCol = cellCoordinates % 10; 

    const pointValue = isFirstPlayer ? 1 : (-1);

    playerSelections[cellRow] += pointValue; // indexes 0-2 hold the points for a horizontal win    
    playerSelections[cellCol + n] += pointValue; // indexes 3-5 hold the points for a vertical win    
    if(cellRow === cellCol)
    {
        playerSelections[n*2] += pointValue; // index 6 holds the points for a diagonal win (L to R Down)
    }
    
    if( (n - 1 - cellCol) === cellRow)
    {
        playerSelections[n*2 + 1] += pointValue; // index 7 holds the points for a diagonal win (L to R Up)
    }
}

function checkForWinner()
{
    return playerSelections.includes(n) || playerSelections.includes(-n);
}

function switchCurrentPlayer()
{
    const currentPlayer = document.getElementById('marker');
    const nextPlayerClass = isFirstPlayer ? icon_playerTwo : icon_playerOne;
    currentPlayer.setAttribute('class', nextPlayerClass);
    isFirstPlayer = !isFirstPlayer;
}

