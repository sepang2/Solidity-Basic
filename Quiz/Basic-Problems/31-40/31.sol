// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 31. string을 input으로 받는 함수를 구현하세요. "Alice"나 "Bob"일 때에만 true를 반환하세요.
contract Q31 {
    function AliceOrBob(string memory _name) public pure returns(bool) {
        if(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Alice")) || keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Bob"))) {
            return true;
        } else {
            return false;
        }
    }
}