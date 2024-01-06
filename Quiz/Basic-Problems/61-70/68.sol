// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 68. 계승(팩토리얼)을 구하는 함수를 구현하세요. 계승은 그 숫자와 같거나 작은 모든 수들을 곱한 값이다. 
// 예) 5 → 1*2*3*4*5 = 120, 11 → 1*2*3*4*5*6*7*8*9*10*11 = 39916800
// while을 사용해보세요
contract Q68 {
    function factorial(uint _n) public pure returns(uint) {
        uint _result = 1;

        while(_n != 0) {
            _result *= _n;
            _n--;
        }

        return _result;
    }
}