// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 24. string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.
/*
keccak256() 사용 시,
보통은 abi.encodePacked()를 쓰지만 string의 경우 bytes()써도 괜찮
*/
contract Q24 {
    function isAlice(string memory _s) public pure returns(bool) {
        if(keccak256(bytes(_s)) == keccak256(bytes("Alice"))) {
            return true;
        } else {
            return false;
        }
    }
}