// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 17. string을 input으로 받는 함수를 구현하세요. 이 함수는 true 혹은 false를 반환하는데 Bob이라는 이름이 들어왔을 때에만 true를 반환합니다.
// Solidity에는 문자열 비교 지원X
// 따라서 string -> bytes로 변환 후 해시함수 keccak256을 이용해 해시값 비교
contract Q17 {
    function stringCompare(string memory _name) public pure returns(bool) {
        if(keccak256(bytes(_name)) == keccak256(bytes("Bob"))) return true;
        else return false;
    }

    // boolean값 return 방법
    function stringCompare2(string memory _name) public pure returns(bool) {
        return keccak256(bytes(_name)) == keccak256(bytes("Bob"));
    }
}