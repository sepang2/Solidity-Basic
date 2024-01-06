// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 66. 특정 숫자를 입력했을 때 자릿수를 알려주는 함수를 구현하세요.
// 추가로 그 숫자를 5진수로 표현했을 때는 몇자리 숫자가 될 지 알려주는 함수도 구현하세요.
contract Q66 {
    function decimal(uint _n) public pure returns(uint) {
        uint _digit;

        while(_n != 0) {
            _n /= 10;
            _digit++;
        }

        return _digit;
    }

    function quinary(uint _n) public pure returns(uint) {
        uint _digit;

        while(_n != 0) {
            _n /= 5;
            _digit++;
        }

        return _digit++;
    }
}