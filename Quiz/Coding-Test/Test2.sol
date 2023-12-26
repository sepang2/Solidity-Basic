// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 학생 점수관리 프로그램입니다.
// 여러분은 한 학급을 맡았습니다.
// 가장 점수가 낮은 사람을 집중관리하려고 합니다.

contract Test2_231226 {
    // 학생은 번호, 이름, 점수로 구성되어 있고(구조체)
    struct Student{
        uint num;
        string name;
        uint score;
    }

    Student[] students;

    function pushStudent(uint _num, string memory _name, uint _score) public {
        students.push(Student(_num, _name, _score));
    }

    // 가장 점수가 낮은 사람의 정보를 보여주는 기능,
    function getLowestScore() public view returns(Student memory) {
        uint _low = 100;
        uint _idx;

        for(uint i = 0; i < students.length; i++) {
            if(_low > students[i].score) {
                _low = students[i].score;
                _idx = i;
            }
        }

        return students[_idx];
    }

    // 총 점수 합계, 총 점수 평균을 보여주는 기능,
    function getTotalScore() public view returns(uint, uint) {
        uint _sum;

        for(uint i = 0; i < students.length; i++) {
            _sum += students[i].score;
        }

        return (_sum, _sum / students.length);
    }

    // 특정 학생을 반환하는 기능 -> 숫자로 반환
    // function getStudent() public view returns(uint) {

    // }

    // 가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array)
    function getAllStudents() public view returns(Student[] memory) {
        return students;
    }
}