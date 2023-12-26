// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// string => array
contract MAPPING {
    struct Student {
        string name;
        uint number;
    }

    mapping(string => Student) students1;    // 담당 교사
    mapping(string => Student[]) students2; // 반 담임 교사

    function setTeacherStudent1(string memory _teacher, Student memory _s1) public {
        students1[_teacher] = _s1;
    }

    function setTeacherStudent2(string memory _teacher, Student memory _s2) public {
        students2[_teacher].push(_s2);
    }

    function getStudent1(string memory _teacher) public view returns(Student memory) {
        return students1[_teacher];
    }

    function getStudent2(string memory _teacher) public view returns(Student[] memory) {
        return students2[_teacher];
    }
}