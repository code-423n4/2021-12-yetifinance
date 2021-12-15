// SPDX-License-Identifier: MIT

pragma solidity 0.6.11;

interface IYetiRouter {

    // Takes the address of the token in, and gives a certain amount of token out.
    function route(address _from, address _tokenAddress, uint _amount, uint _minSwapAmount) external;

    // Requires certain amount of token out given avax in. 
    function routeAVAX(address _from, uint _minSwapAmount) external payable;
}
