// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.6.11;

import "./Interfaces/IERC20.sol";

/*
 * Brought to you by @YetiFinance
 * Holds/Distributes Yeti Finance Treasury Tokens
*/
contract YetiFinanceTreasury {

    address teamWallet;

    event teamWalletUpdated(address newTeamWallet);

    constructor() public {
        teamWallet = msg.sender;
        emit teamWalletUpdated(msg.sender);
    }

    modifier onlyTeam() {
        require(msg.sender == teamWallet);
        _;
    }

    function sendToken(IERC20 _token, address _to, uint _amount) external onlyTeam {
        _token.transfer(_to, _amount);
    }

    function updateTeamWallet(address _newTeamWallet) external onlyTeam {
        require(_newTeamWallet != 0, "New team wallet cannot be 0");
        teamWallet = _newTeamWallet;
        emit teamWalletUpdated(_newTeamWallet);
    }

    function getTeamWallet() external view returns (address) {
        return teamWallet;
    }

}