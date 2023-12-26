// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// 복수 조건(and, or)
contract IF2 {
    function Numbers(uint _number) public pure returns(string memory) {
        if(_number >= 40 && _number <= 60 || _number >= 100 && _number <= 150 || _number % 5 == 0) {
            return "A";
        } else if(_number % 3 == 0) {
            return "B";
        } else {
            return "C";
        }
    }
}

// _number >= 40 && _number <= 60 || _number % 2 == 0 || _number % 3 == 0
// _number >= 40 && _number <= 60 || _number >= 100 && _number <= 150 || _number % 5 == 0