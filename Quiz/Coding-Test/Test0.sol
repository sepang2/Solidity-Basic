// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
이름, 번호, 점수, 학점(string)을 가진 학생 구조체를 구현하세요

학생들이 들어가는 array 를 만들고 그 array에 학생 정보를 입력하는 함수를 구현하세요

학생 정보를 입력하는 함수는 3개의 input 값만 받게 하고 grade는 setGrade 함수를 이용하여 자동으로 기입되도록 구현하세요

점수는 90이상이면 A, 80이상이면 B, 70이상이면 C 그 외에는 F를 내는 함수를 구현하세요.

학생 전체를 반환받는 함수, 학생들의 숫자를 반환하는 함수를 구현하세요
*/

contract AAA {
    struct Student {
        string name;
        uint number;
        uint score;
        string grade;
    }

    Student[] students;

    function pushStudent(string memory _name, uint _number, uint _score) public {
        students.push(Student(_name, _number, _score, setGrade(_score)));
    }

    function getStudent() public view returns(Student[] memory) {
        return students;
    }

    function getStudentNum() public view returns(uint) {
        return students.length;
    }

    function setGrade(uint _score) public pure returns(string memory) {
        if(_score >= 90) {
            return "A";
        } else if(_score >= 80) {
            return "B";
        } else if(_score >= 70) {
            return "C";
        } else {
            return "F";
        }
    }
}