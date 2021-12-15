// SPDX-License-Identifier: MIT

pragma solidity 0.6.11;

// Common interface for the Trove Manager.
interface IBorrowerOperations {

    // --- Events ---

    event TroveManagerAddressChanged(address _newTroveManagerAddress);
    event ActivePoolAddressChanged(address _activePoolAddress);
    event DefaultPoolAddressChanged(address _defaultPoolAddress);
    event StabilityPoolAddressChanged(address _stabilityPoolAddress);
    event GasPoolAddressChanged(address _gasPoolAddress);
    event CollSurplusPoolAddressChanged(address _collSurplusPoolAddress);
    event PriceFeedAddressChanged(address  _newPriceFeedAddress);
    event SortedTrovesAddressChanged(address _sortedTrovesAddress);
    event YUSDTokenAddressChanged(address _yusdTokenAddress);
    event SYETIAddressChanged(address _sYETIAddress);

    event TroveCreated(address indexed _borrower, uint arrayIndex);
    event TroveUpdated(address indexed _borrower, uint _debt, uint _coll, uint8 operation);
    event YUSDBorrowingFeePaid(address indexed _borrower, uint _YUSDFee);

    // --- Functions ---

    function setAddresses(
        address _troveManagerAddress,
        address _activePoolAddress,
        address _defaultPoolAddress,
        address _stabilityPoolAddress,
        address _gasPoolAddress,
        address _collSurplusPoolAddress,
        address _sortedTrovesAddress,
        address _yusdTokenAddress,
        address _sYETIAddress,
        address _whiteListAddress
    ) external;

    function openTrove(uint _maxFeePercentage, uint _YUSDAmount, address _upperHint,
        address _lowerHint,
        address[] calldata _colls,
        uint[] calldata _amounts) external;


    function closeTrove() external;

    function adjustTrove(
        address[] calldata _collsIn,
        uint[] calldata _amountsIn,
        address[] calldata _collsOut,
        uint[] calldata _amountsOut,
        uint _YUSDChange,
        bool _isDebtIncrease,
        address _upperHint,
        address _lowerHint,
        uint _maxFeePercentage) external;

    function addColl(address[] memory _collsIn, uint[] memory _amountsIn, address _upperHint, address _lowerHint, uint _maxFeePercentage) external;

    function withdrawColl(address[] memory _collsOut, uint[] memory _amountsOut, address _upperHint, address _lowerHint) external;

    function withdrawYUSD(uint _maxFeePercentage, uint _YUSDAmount, address _upperHint, address _lowerHint) external;

    function repayYUSD(uint _YUSDAmount, address _upperHint, address _lowerHint) external;

    function claimCollateral() external;

    function getCompositeDebt(uint _debt) external pure returns (uint);
}
