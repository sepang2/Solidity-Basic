// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 28. ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
/*
bytes()를 이용해 keccak256()을 사용해도 좋지만,
복수의 값을 input으로 사용할 땐 abi.encodePacked()를 사용해야 함.
*/
contract Q28 {
    function getHash(string memory _ID, string memory _PW) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_ID, _PW));
    }
}