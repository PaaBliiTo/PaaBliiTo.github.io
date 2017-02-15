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

	adress chairperson;
	mapping(adress => Voter) voters;
	Proposal[] proposals;

	function Ballot(uint8 _numProposals) {
		chairperson = msg.sender;
		proposals.length = _numProposals
	}

	function vote(uint8 proposal) {
		Voter sender = voters[msg.sender];
		if(sender.voted || proposal >= proposals.length) return;
		sender.voted = true;
		sender.vote = proposal;
		proposals[proposal].voteCount += 1;
	}

	function winningProposal() constant return (uint8 winningProposal) {
		uint256 winningVoteCount = 0;
		for(uint8 proposal = 0; proposal < proposals.length; proposal++){
			if(proposals[proposal].voteCount > winningVoteCount) {
				winningVoteCount = proposals[proposal].voteCount;
				winningProposal = proposal;
			}
		}
	}
}