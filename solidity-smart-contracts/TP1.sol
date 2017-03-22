pragma solidity ^0.4.0;


//Simple vote whith no delegation : no need to add weigth (equals to 1)

contract TP1 {

	struct Voter {
		bool voted;
		uint8 vote;
	}

	struct Proposal {
		uint voteCount;
	}

	address chairperson;

	//Mapping of voters
	mapping(address => Voter) voters;
	Proposal[] proposals;

	function Ballot(uint8 _numProposals) {
		chairperson = msg.sender;
		proposals.length = _numProposals;
	}

	//Let a user vote
	function vote(uint8 proposal) {

		//Get the voter calling the contract
		Voter sender = voters[msg.sender];

		//Check if the user already voted or if the number of the proposal is incorrect
		if(sender.voted || proposal >= proposals.length) return;
		sender.voted = true;
		sender.vote = proposal;
		proposals[proposal].voteCount += 1;
	}

	//Return the proposal that won the vote
	function winningProposal() constant returns (uint8 winningProposal) {
		uint256 winningVoteCount = 0;

		//Checks for every proposal what is the one which has the most votes
		for(uint8 proposal = 0; proposal < proposals.length; proposal++){
			if(proposals[proposal].voteCount > winningVoteCount) {
				winningVoteCount = proposals[proposal].voteCount;
				winningProposal = proposal;
			}
		}
	}
}