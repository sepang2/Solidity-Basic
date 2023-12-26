// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 8. 아래의 함수를 만드세요
// 1~10을 입력하면 “A” 반환받습니다.
// 11~20을 입력하면 “B” 반환받습니다.
// 21~30을 입력하면 “C” 반환받습니다.
contract Q8 {
    function getLetter(uint _a) public pure returns(string memory) {
        if(_a >= 1 && _a <= 10) {
            return "A";
        } else if(_a >= 11 && _a <= 20) {
            return "B";
        } else if(_a >= 21 && _a <= 30) {
            return "C";
        } else {
            return "No input";
        }
    }
}