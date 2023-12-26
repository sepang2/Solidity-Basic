// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// struct 안에 array
contract STRUCT {
    struct Student {
        string name;
        uint number;
        string[] classes;
    }

    Student[] students;

    Student s1;
    Student s2;
    Student s3;

    // 구조체형 안의 값을 다 따로 받는 input
    function setStudent1(string memory _name, uint _number, string[] memory _classes) public {
        s1 = Student(_name, _number, _classes); // abc, 1, ["a", "b", "c"]
    }

    // 구조체형 input
    function setStudent2(Student memory _s) public {
        s2 = _s; // [abc, 1, ["a", "b", "c"]]
    }

    function setStudent3(string memory _name, uint _number, string[] memory _classes) public {
        s3 = Student({
            name : _name,
            number : _number,
            classes : _classes
        });
    }
    
    function pushStudent(Student memory _s) public {
        students.push(_s);
    }

    function getStudent() public view returns(Student[] memory) {
        return students;
    }
}