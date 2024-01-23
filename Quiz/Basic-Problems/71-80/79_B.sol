// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 79. 3개의 숫자를 넣으면 그 중에서 가장 큰 수를 찾아내주는 함수를 Contract A에 구현하세요.
// Contract B에서는 이름, 번호, 점수를 가진 구조체 학생을 구현하세요.
// 학생의 정보를 3명 넣되 그 중에서 가장 높은 점수를 가진 학생을 반환하는 함수를 구현하세요.
// 구현할 때는 Contract A를 import 하여 구현하세요.
import "./79_A.sol";

contract Q79_B {
    Q79_A A = new Q79_A();

    struct Student {
        string name;
        uint num;
        uint score;
    }

    function setStudents(Student memory _st1, Student memory _st2, Student memory _st3) public view returns(Student memory) {
        Student[3] memory students;
        (students[0], students[1], students[2]) = (_st1, _st2, _st3);

        uint high = A.getBiggest(_st1.score, _st2.score, _st3.score);

        for(uint i = 0; i < 2; i++) {
            if(students[i].score == high) {
                return students[i];
            }
        }
    }
}