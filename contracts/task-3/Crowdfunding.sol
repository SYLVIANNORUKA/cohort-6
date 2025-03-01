// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./CrowdToken.sol";
import "./CrowdNFT.sol";

contract Crowdfunding{
    // declare some state variables
    address public owner;
    CrowdToken public rewardToken;
    CrowdNFT public rewardNFT;
    uint256 public fundingGoal;
    uint256 public totalFunds;
    mapping(address => uint256) public contributions;

    event Funded(address indexed contributor, uint256 amount); 
    event GoalReached(uint256 totalFunds);
    event NFTRewarded(address indexed recipient);

    constructor(address _token, address _nft, uint256 _goal){
        owner = msg.sender;
        rewardToken = CrowdToken(_token);
        rewardNFT = CrowdNFT(_nft);
        fundingGoal = _goal;
    }

function contribute() public payable{
    require(msg.value > 0, "Contribution must be greater than 0");

    contributions[msg.sender] +=msg.value;
    totalFunds += msg.value;

    // Reward ERC20 TOken 
    rewardToken.rewardFunder(msg.sender, msg.value);

    // if contribution exceeds threshold, mint an NFT 
    if (msg.value >=rewardNFT.fundingThreshold()){
        rewardNFT.mintNFT(msg.sender);
        emit NFTRewarded(msg.sender);
    }

    emit Funded(msg.sender, msg.value);

    if(totalFunds >= fundingGoal){
        emit GoalReached(totalFunds);
    }
}

function withdrawFunds() public {
    require(msg.sender == owner, "Only owner can withdraw");
    require(totalFunds >= fundingGoal, "Funding goal not met");

    payable(owner.transfer(address(this).balance));
}
    
}