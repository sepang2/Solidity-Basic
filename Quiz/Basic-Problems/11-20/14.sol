// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 14. 학번, 이름, 듣는 수업 목록을 포함한 학생 구조체를 선언하고 학생들을 관리할 수 있는 array를 구현하세요.
// array에 학생을 넣는 함수도 구현하는데 학생들의 학번은 1번부터 순서대로 2,3,4,5 자동 순차적으로 증가하는 기능도 같이 구현하세요.
contract Q14 {
    struct Student {
        uint studentID;
        string name;
        string[] classes;
    }

    Student[] students;

    function pushStudent(string memory _name, string[] memory _classes) public {    
        students.push(Student(students.length + 1, _name, _classes));
    }
}