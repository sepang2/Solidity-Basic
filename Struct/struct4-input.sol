// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// Struct에 다양한 형태로 값 넣기
contract STRUCT {
    struct Student {
        string name;
        uint number;
    }

    Student[] class;

    Student s1;
    Student s2;
    Student s3;

    // 구조체 전체값 한 번에 넣기
    // 구조체형 변수 = 구조체명(input1, input2)
    function setStudent1(string memory _name, uint _number) public {
        s1 = Student(_name, _number);
    }

    // 구조체의 특정값만 넣기
    function setStudent2(string memory _name, uint _number) public {
        s2.name = _name;
        s2.number = _number;
    }

    function setStudent3(string memory _name, uint _number) public {
        s3 = Student({
            name : _name,
            number : _number
        });
    }

    function getStudent() public view returns(Student memory, Student memory, Student memory) {
        return (s1, s2, s3);
    }
}