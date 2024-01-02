// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 49. 긴 숫자를 넣었을 때, 마지막 3개의 숫자만 반환하는 함수를 구현하세요.
// 예) 459273 → 273 // 492871 → 871 // 92218 → 218
contract Q49 {
    function getLastThreeNums(uint _n) public pure returns(uint) {
        return _n % 1000;
    }

    function getFirstThreeNums(uint _n) public pure returns(uint) {
        uint tmp = _n;
        uint digit = 1;

        while(tmp / 10 != 0) {
            tmp /= 10;
            digit++;
        }

        return _n / 10**(digit - 3); 
    }
}

contract Q49_2 {
    function getDigits(uint _n) public pure returns(uint) {
        uint _m = 1;
        while(_n >= 10**_m) {
            _m++;
        }

        return _m;
    }

    function getDigits2(uint _n) public pure returns(uint) {
        uint digit = 1;

        while(_n / 10 != 0) {
            _n /= 10;
            digit++;
        }

        return digit;
    }

    function firstThree(uint _n) public pure returns(uint) {
        require(_n >= 100);
        return _n / 10**(getDigits(_n) - 3);
    }
}