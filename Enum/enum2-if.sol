// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// if와 함께
contract ENUM {
    enum Status {
        a,
        b,
        c,
        d,
        f
    }

    Status grade;

    function getGrade() public view returns(Status) {
        return grade;
    }

    function setGrade(uint _score) public {
        if(_score >= 90) {
            grade = Status.a;
        } else if(_score >= 80) {
            grade = Status.b;
        } else if(_score >= 70) {
            grade = Status.c;
        } else if(_score >= 60) {
            grade = Status.d;
        } else {
            grade = Status.f;
        }
    }
}