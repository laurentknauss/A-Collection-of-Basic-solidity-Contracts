// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

/** 
* Overall logic of this contract : 
* -The constructor initializes the contract by setting the 'chairperson' to the address that deploys the contract and assigns him/her the right to vote;
* -Proposals for votes are stored in an array .
* Voting process : voters can cast their votes for a proposal and the counts of voted proposals are updated accordingly.
* The winning proposal is selected based on the highest number of votes for it and the ame of the highest voted proposal is provided.



/// @title Ballot
/// @dev Implements a simple voting process .
contract Ballot {

///@notice Custom error for when, a voter has already voted .
error alreadyVoted(address voter);
    }

    /// @notice Represents a single proposal
    struct Proposal {
        bytes32 proposalName; 
        /// @notice Number of accumulated votes 
        uint voteCount; 
    }

    /// @notice Address of the chair person who deployed the contract 
    address public chairperson;

    mapping(address => Voter) public voters;

    Proposal[] public proposals;

    /// @
     
    constructor(bytes32[] memory proposalNames) { // The array is of bytes32 type 
        chairperson = msg.sender; // we are setting  a "chairperson" variable to the value of msg.sender meanign whover is deploying the contract will be 
        //the sender 

        voters[chairperson].weight = 1; // A mapping  of voters 


        /// Initializing proposals 
        for (uint i = 0; i < proposalNames.length; i++) {
            /// @dev 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }



     /// @dev Anyone can vote and call this 'vote' function 
     /// @dev A caller of this function is automatically granted the right to vote if he/she has not voted yet.
    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];

        if (:sender.voted) { 

        require(sender.weight != 0, "Has no right to vote");
        require(!sender.voted, "Already voted.");
        sender.voted = true;
        sender.vote = proposal;

      
        proposals[proposal].voteCount += sender.weight;
    }

   
    function winningProposal() external view
            returns (uint winningProposal_)
    {
        uint winningVoteCount = 0;
        // We loop over all the proposals 
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }

    /// 
    function winningProposalName() public view returns (bytes32 winnerName_) {
            winnerName_ = proposals[winningProposal()].name; 
    
}
