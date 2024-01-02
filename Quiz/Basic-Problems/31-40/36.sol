// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 36. high, neutral, low 상태를 구현하세요.
// a라는 변수의 값이 7이상이면 high, 4이상이면 neutral 그 이후면 low로 상태를 변경시켜주는 함수를 구현하세요.
contract Q36 {
    enum Status {
        low,
        neutral,
        high
    }

    Status a;

    function setA(uint _a) public {
        if(_a >= 7) {
            a = Status.high;
        } else if(_a >= 4) {
            a = Status.neutral;
        } else {
            a = Status.low;
        }
    }

    function getStatus() public view returns(Status) {
        return a;
    }
}