// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 63. 2개 숫자의 차를 나타내는 함수를 구현하세요.
contract Q63 {
    function sub(uint a, uint b) public pure returns(uint) {
        if(a > b) return a - b;
        else return b - a;
    }

    function sub2(uint a, uint b) public pure returns(uint) {
        if(a < b) {
            (a, b) = (b, a);
        }

        return a - b;        
    }
}