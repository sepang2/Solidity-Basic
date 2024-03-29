// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// string은 특별한 형태의 bytes
// string <-> bytes 형변환
// ascii code
contract STRING_BYTES {
    function stringToBytes(string memory _s) public pure returns (bytes memory) {
        return bytes(_s);
    }

    function stringToBytes2(string memory _s) public pure returns (bytes memory) {
        return abi.encodePacked(_s);
    }

    function bytesToString(bytes memory _b) public pure returns (string memory) {
        return string(_b);
    }

    // string(_arg); 가 안되던 시절엔 이렇게 했음
    function bytesToString2(bytes memory _b) public pure returns (string memory) {
        return string(abi.encodePacked(_b));
    }
}
