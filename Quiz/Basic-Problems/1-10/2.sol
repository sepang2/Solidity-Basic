// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 2. 2개의 Input값을 가지고 1개의 output값을 가지는 4개의 함수를 만드시오. 각각의 함수는 더하기, 빼기, 곱하기, 나누기(몫)를 실행합니다.
contract Q2 {
    function sum(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }

    function sub(uint _a, uint _b) public pure returns(uint) {
        return _a - _b;
    }
    
    function mul(uint _a, uint _b) public pure returns(uint) {
        return _a * _b;
    }
    
    function div(uint _a, uint _b) public pure returns(uint) {
        return _a / _b;
    }
}