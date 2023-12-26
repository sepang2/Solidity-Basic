// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 1. 더하기, 빼기, 곱하기, 나누기 그리고 제곱을 반환받는 계산기를 만드세요
contract Q1 {
    function add(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }

    function sub(int _a, int _b) public pure returns(int) {
        return _a - _b;
    }

    function mul(uint _a, uint _b) public pure returns(uint) {
        return _a * _b;
    }

    function div(uint _a, uint _b) public pure returns(uint, uint) {
        return (_a / _b, _a % _b);
    }

    function sqr(uint _a) public pure returns(uint) {
        return _a**2;
    }
}