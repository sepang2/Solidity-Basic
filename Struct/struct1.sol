// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

/*
Struct는 내가 여러 변수를 넣어서 customizing한 새로운 변수형이라고 생각
즉 uint, string과 같은 변수형으로 생각하면 편함
*/
contract STRUCT {
    struct Student {
        string name;
        uint number;
        uint score;
        string grade;
    }

    // uint n; 같은 느낌
    // 즉 string, uint, uint, string값을 갖는 구조체형의 변수 s임
    Student s;
    
    function setS(string memory _name, uint _number, uint _score, string memory _grade) public {
        s = Student(_name, _number, _score, _grade);
    }

    function getS() public view returns(Student memory) {
        return s;
    }

    function getSName() public view returns(string memory) {
        return s.name;
    }

    function getSNumber() public view returns(uint) {
        return s.number;
    }
    
}