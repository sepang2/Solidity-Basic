// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 34. 이름, 번호, 점수가 들어간 학생 구조체를 선언하세요.
// 학생들을 관리하는 자료구조도 따로 선언하고 학생들의 전체 평균을 계산하는 함수도 구현하세요.
contract Q34 {
    struct Student {
        string name;
        uint number;
        uint score;
    }

    Student[] students;

    function pushStudent(Student memory _s) public {
        students.push(_s);
    }

    function getAvg() public view returns(uint) {
        uint _total;

        for(uint i = 0; i < students.length; i++) {
            _total += students[i].score;
        }

        return _total / students.length;
    }
}