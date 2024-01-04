// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
--------------------------------------------------------------------------------------------
문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
*/

contract Test6_240104 {
    function getDigit(uint _n) internal pure returns(uint) {
        uint digit = 1;

        while(_n / 10 != 0) {
            _n /= 10;
            digit++;
        }

        return digit;
    }

    function getNum(uint _n) internal pure returns(uint[] memory) {
        uint[] memory nums = new uint[](getDigit(_n));
        uint tmp = _n;

        for(uint i = 0; i < getDigit(_n); i++) {
            nums[i] = tmp / 10**(getDigit(tmp) - 1);
            tmp %= 10**(getDigit(tmp) - 1);
        }
        
        return nums;
    }
    
    function getNumbers(uint _n) public pure returns(uint, uint[] memory) {
        return (getDigit(_n), getNum(_n));
    }

    function getStr(string memory _s) internal pure returns(string[] memory) {
        
    }

    function getStrings(string memory _s) public pure returns(uint, string[] memory) {
        return (bytes(_s).length, getStr(_s));
    }
}