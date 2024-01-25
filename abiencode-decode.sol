// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract encodedecode {
    function encode(string memory _s1, uint _n, string memory _s2) public pure returns (bytes memory) {
        return (abi.encode(_s1, _n, _s2));
    }

    function decode(bytes memory data) public pure returns (string memory _s1, uint _n, string memory _s2) {
        (_s1, _n, _s2) = abi.decode(data, (string, uint, string));
    }

    function decode2(bytes memory data) public pure returns (bytes memory _b1, uint _n, bytes memory _b2) {
        (_b1, _n, _b2) = abi.decode(data, (bytes, uint, bytes));
    }

    // bytes1은 offset이 필요 없음 -> abi.encode() 결과값의 offset부분과 length부분이 맞지 않음 -> 오류
    function decode3(bytes memory data) public pure returns (bytes1 _b1, uint _n, bytes1 _b2) {
        (_b1, _n, _b2) = abi.decode(data, (bytes1, uint, bytes1));
    }

    function decode4(bytes memory data) public pure returns(uint _n1, uint _n2, uint _n3, uint _n4, uint _n5, uint _n6, uint _n7) {
        (_n1, _n2, _n3, _n4, _n5, _n6, _n7) = abi.decode(data, (uint, uint, uint, uint, uint, uint, uint));
    }
}

/*
0x
0000000000000000000000000000000000000000000000000000000000000060 // offset
000000000000000000000000000000000000000000000000000000000000000c // 12
00000000000000000000000000000000000000000000000000000000000000a0 // a, b offset
0000000000000000000000000000000000000000000000000000000000000001 // a length
6100000000000000000000000000000000000000000000000000000000000000 // a
0000000000000000000000000000000000000000000000000000000000000001 // b length
6200000000000000000000000000000000000000000000000000000000000000 // b
*/