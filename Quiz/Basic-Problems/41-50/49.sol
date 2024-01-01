// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 49. 긴 숫자를 넣었을 때, 마지막 3개의 숫자만 반환하는 함수를 구현하세요.
// 예) 459273 → 273 // 492871 → 871 // 92218 → 218
contract Q49 {
    function getLastThreeNums(uint _n) public pure returns(uint) {
        return _n % 1000;
    }
}