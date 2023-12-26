// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// string => STRUCT
contract MAPPING {
    struct Student {
        // string name;
        uint number;
        uint score;
        string home_address;
    }
    
    mapping(string => Student) students;

    function setStudent(string memory _name, uint _number, uint _score, string memory _home) public {
        students[_name] = Student(_number, _score, _home);
    }

    function getStudent(string memory _name) public view returns(Student memory) {
        return students[_name];
    }
}