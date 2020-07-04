pragma solidity ^0.4.23;

contract SolidityCrudApp{

struct player{
    string name;
    string country;
    uint256 rank;
}

player[] public players;

uint256 public totalPlayers;

constructor() public{
    totalPlayers = 0;
}


event PlayerEvent(string playerName,string country, uint256 rank);
event RankUpdated(string playerName, string rank);
event PlayerDelete(string playerName);

function insert(string playerName, string country, uint256 rank) public returns (uint256 totalPlayers){
    player memory newPlayer = player(playerName, country, rank);
    players.push(newPlayer);
    totalPlayers++;
    emit PlayerEvent(playerName, country , rank);
    return totalPlayers;
}

function updateRank(string playerName, string newRank) public returns (bool success){
    for(uint256 i=0; i<totalplayers; i++) {
        if(compareStrings(players[i].name, playerName )) {
            players[i].rank = newPlayer;
            emit RankUpdated(playerName, newRank);
            return true;
        }
    }

    return false;
}

   function deletePlayer(string playerName) public returns (bool success){
       require(totalPlayers >0);
       for (uint256 i=0 ; i< totalPlayers ; i++) {
           if(compareStrings(players[i].name, playerName)){
               players[i] = players[totalPlayers-1];
               delete players[totalPlayers-1];
               totalPlayers--;
               players.length--;
               emit PlayerDelete(palyerName);
               return true;
           }
       } return false;
   }
   function getPlayer(string playerName) public view returns(string name, string country, uint256 rank){
       for (uint256 i =0; i<totalPlayers; i++)
       {
           if(compareStrings(players[i].name, playerName)){
               return (players[i].name, players[i].country, players[i].rank);
           }
       }
       revert('player not found');
   }  
      function compareStrings(string a, string b) internal pure returns(bool){
          return keccak256(a) = keccak256(b);
      }

      function getTotalPlayers() public view returns(uint256 length){
          return players.length;
      }

}