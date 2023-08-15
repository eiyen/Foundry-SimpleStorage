// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract SimpleStorage {
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    uint256 private myFavoriteNumber;
    Person[] public listOfPeople;
    mapping(string => uint256) public nameToFavoriteNumber;

    event storedNumber(
        uint256 indexed olderNumber,
        uint256 indexed newNumber,
        uint256 addNumber,
        address sender
    );

    function store(uint256 _favoriteNumber) public {
        emit storedNumber(
            myFavoriteNumber,
            _favoriteNumber,
            myFavoriteNumber + _favoriteNumber,
            msg.sender
        );
        myFavoriteNumber = _favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function getMyFavoriteNumber() public view returns (uint256) {
        return myFavoriteNumber;
    }
}