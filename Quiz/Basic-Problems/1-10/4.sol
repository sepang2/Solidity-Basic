// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 4. 이름(string), 번호(uint), 듣는 수업 목록(string[])을 담은 student라는 구조체를 만들고
// 그 구조체들을 관리할 수 있는 array, students를 선언하세요.
contract Q4 {
    struct Student {
        string name;
        uint number;
        string[] classes;
    }

    Student[] students;
}