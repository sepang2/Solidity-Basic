// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract CONSTRUCTOR {
    uint a;
    uint b;

    constructor() {
        a = 5;
        b = 7;
    }

    function getAB() public view returns(uint, uint) {
        return (a, b);
    }
}

contract CONSTRUCTOR2 {
    string a;
    uint b;

    constructor(string memory _a, uint _b) {
        a = _a;
        b = _b;
    }

    function getAB() public view returns(string memory, uint) {
        return (a, b);
    }
}

contract CONSTRUCTOR3 {
    struct teacher {
        string name;
        uint number;
    }

    teacher T;

    struct Student {
        string name;
        uint score;
        string grade;
    }

    Student[] students;

    constructor(string memory _name, uint _number) {
        T = teacher(_name, _number);
    }

    function getTeacher() public view returns(teacher memory) {
        return T;
    }
}

contract CONSTRUCTOR4 {
    bytes32 pw;

    constructor(string memory _pw) {
        pw = keccak256(abi.encodePacked(_pw));
    }

    function PW(string memory _pw) public view returns(bool) {
        if(keccak256(abi.encodePacked(_pw)) == pw) {
            return true;
        } else {
            return false;
        }
    }
}

contract CONSTRUCTOR5 {
    bool higherThanTen;
    
    constructor(uint _a) {
        if(_a > 10) {
            higherThanTen = true;
        } else {
            higherThanTen = false;
        }
    }

    function getHigherThanTen() public view returns(bool) {
        return higherThanTen;
    }
}