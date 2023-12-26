// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 5. 아래의 함수를 만드세요
// 1~3을 입력하면 입력한 수의 제곱을 반환받습니다.
// 4~6을 입력하면 입력한 수의 2배를 반환받습니다.
// 7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환받습니다.
contract Q5 {
    function No5(uint _a) public pure returns(uint) {
        if(_a >= 1 && _a <= 3) {
            return _a**2;
        } else if(_a >= 4 && _a <= 6) {
            return _a * 2;
        } else if(_a >= 7 && _a <= 9) {
            return _a % 3;
        } else {
            return _a;
        }
    }
}