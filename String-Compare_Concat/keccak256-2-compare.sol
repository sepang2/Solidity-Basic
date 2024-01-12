// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 문자열 비교
// Solidity에는 문자열 비교 지원X
// 따라서 string -> bytes로 변환 후 해시함수 keccak256을 이용해 해시값 비교
contract COMPARE {
    // 1. keccak 256 설명 -> uint 256은 bytes memory로 변환 불가능
    // 2. bytes <-> string 형변환 설명
    // 3. abi.encodePacked (abi = Application Binary Interface)

    // 1. uint -> bytes32로 변환 (bytes memory 불가능, bytes32 가능)
    function hashFunction_uint(uint _n) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_n));
    }

    // 2. string -> bytes 형변환
    function hashFunction_string(string memory _n) public pure returns(bytes32) {
        return keccak256(bytes(_n));
    }

    // 3. abi.encodePacked를 이용한 문자열 비교
    function compare(string memory _s) public pure returns(bool) {
        // require(bytes(_s).length == bytes("abc").length);
        if(keccak256(abi.encodePacked(_s)) == keccak256(abi.encodePacked("abc"))) {
            return true;
        } else {
            return false;
        }
    }
}