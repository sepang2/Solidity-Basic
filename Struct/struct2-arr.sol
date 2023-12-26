// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// struct with array
contract STRUCT {
    struct Student {
        string name;
        bool isMale;
        uint number;
    }

    // uint[] arr; 같은 느낌
    // 즉 '구조체형'의 '배열'임
    Student[] class;

    function pushStudent(string memory _name, bool _isMale, uint _number) public {
        class.push(Student(_name, _isMale, _number));
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return class[_n - 1];
    }

    function getClass() public view returns(Student[] memory) {
        return class;
    }
}