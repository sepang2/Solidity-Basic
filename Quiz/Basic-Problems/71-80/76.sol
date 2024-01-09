// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 76. 숫자 123을 넣으면 문자 123으로 반환하는 함수를 직접 구현하세요.
contract Q76 {
    function numToStr(uint _n) public pure returns (string memory) {
        return string(bytes(_n));
    }
}
