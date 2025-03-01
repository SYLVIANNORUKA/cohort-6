// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CrowdToken is ERC20, Ownable{
    constructor () ERC20("CrowdToken", "CTK"){
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function rewardFunder(address funder, uint256 amount)external onlyOwner{
        _mint(funder, amount * 10 ** decimals());
    }
}