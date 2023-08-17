// SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract SimpleStorage {
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    uint256 private myFavoriteNumber;
    Person[] private listOfPeople;
    mapping(string => uint256) private nameToFavoriteNumber;

    event storedNumber(
        uint256 indexed olderNumber,
        uint256 indexed newNumber,
        uint256 addNumber,
        address sender
    );

    function store(uint256 _favoriteNumber) external {
        emit storedNumber(
            myFavoriteNumber,
            _favoriteNumber,
            myFavoriteNumber + _favoriteNumber,
            msg.sender
        );
        myFavoriteNumber = _favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) external {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function getMyFavoriteNumber() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function getLengthOfListOfPeople() public view returns(uint256) {
        return listOfPeople.length;
    }

    function getSpecificPersonInListOfPeople(uint256 _index) public view returns(Person memory) {
        return listOfPeople[_index];
    }

    function getNameToFavoriteNumber(string memory _name) public view returns(uint256) {
        return nameToFavoriteNumber[_name];
    }
}