// SPDX-License-Identifier: MIT

pragma solidity 0.6.11;

interface ITraderJoeZap {
    function zapOut(address _from, uint256 amount) external;
}