// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 62. 2개의 숫자를 더하는 함수, 곱하는 함수 a의 b승을 반환하는 함수를 구현하는데
// 3개의 함수 모두 2개의 input값이 10을 넘지 않아야 하는 조건을 최대한 효율적으로 구현하세요.
contract Q62 {
    modifier maxTen(uint _a, uint _b) {
        require(_a <= 10 && _b <= 10, "Under 10");
        _;
    }

    function add(uint _a, uint _b) public pure maxTen(_a, _b) returns(uint) {
        return _a + _b;
    }

    function mul(uint _a, uint _b) public pure maxTen(_a, _b) returns(uint) {
        return _a * _b;
    }

    function power(uint _a, uint _b) public pure maxTen(_a, _b) returns(uint) {
        return _a**_b;
    }
}