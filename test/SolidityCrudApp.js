const SolidityCrudApp = artifacts.require('./contracts/SolidityCrudApp.sol')const assert = require('assert')
let crudInstance;
contract('SolidityCrudApp' , (accounts)  => {beforeEach(async () => {crudInstance = await SolidityCrudApp.deployed()})
it('should insert new user' , async() => {await crudInstance.insert("Ricky" , "Australia" , 12);
const player = await crudInstance.getPlayer("Ricky");assert.equal(player[0], "Ricky");assert.equal(player[1], "Australia" );assert.equal(player[2].toNumber() , 12);
await crudInstance.updateRank("Ricky", 10);
const player1 = await crudInstance.getPlayer(("Ricky");assert.equal(player1[0], "Ricky");assert.equal(player1[1], "Australia");assert.equal(player1[2].toNumber() , 12);
await crudInstance.deletePlayer("Ricky");
const total = await crudInstance.getTotalPlayers();assert.equal(total, 0);})
})
