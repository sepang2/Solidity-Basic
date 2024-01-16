// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 61. a의 b승을 반환하는 함수를 구현하세요.
contract Q61 {
    function power(uint a, uint b) public pure returns (uint) {
        return a ** b;
    }
}
