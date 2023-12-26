// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 12. 숫자 3개를 더해주는 함수, 곱해주는 함수 그리고 순서에 따라서 a*b+c를 반환해주는 함수 3개를 각각 구현하세요.
contract Q12 {
    function add(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a + _b + _c;
    }

    function mul(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a * _b * _c;
    }

    function mulNsum(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a * _b + _c;
    }
}