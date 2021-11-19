pragma solidity >=0.4.22 <0.8.0;

contract Election {
 // Model a candidate
 struct Candidate{
  uint id;
  string name;
  uint voteCount;
 }
// Store a candidate
//Fetch Candidate
 mapping(address => bool) public voters;
 mapping(uint => Candidate) public candidates;
 function vote(uint _candidateId) public {
  //record  that voter has voted
  // require that the voter hasn't voted before
  require (!voters[msg.sender]);
// require a valid candidate
  require (_candidateId > 0 && _candidateId <= candidatesCount);
  voters[msg.sender] = true;
// update candiadte voteCount
  candidates[_candidateId].voteCount ++;
  }
 // Store candidate count 
 uint public candidatesCount;
//constructor
 constructor() public {
  addCandidate("KamalHaasan");
  addCandidate("RajniKanth");
 }
function addCandidate (string memory _name) private {
  candidatesCount ++;
  candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
 }
}