// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 79. 3개의 숫자를 넣으면 그 중에서 가장 큰 수를 찾아내주는 함수를 Contract A에 구현하세요.
// Contract B에서는 이름, 번호, 점수를 가진 구조체 학생을 구현하세요.
// 학생의 정보를 3명 넣되 그 중에서 가장 높은 점수를 가진 학생을 반환하는 함수를 구현하세요.
// 구현할 때는 Contract A를 import 하여 구현하세요.
contract Q79_A {
    function getBiggest(uint _a, uint _b, uint _c) public pure returns(uint) {
        if(_a >= _b && _a >= _c) {
            return _a;
        } else if(_b >= _a && _b >= _c) {
            return _b;
        } else {
            return _c;
        }
    }
}