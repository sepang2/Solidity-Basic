// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract BYTESUINT {
    function uintToBytes(uint _a) public pure returns(bytes memory) {
        return abi.encodePacked(_a);
    }

    function bytes1ToUint8(bytes1 _b) public pure returns(uint8) {
        return uint8(_b);
    }

    function bytes_utils(bytes memory _b) public pure returns(bytes1, bytes1) {
        return (_b[0], _b[1]);
    }

    function bytesToUint(bytes memory _b) public pure returns(uint) {
        uint decimal;

        for(uint i = 0; i < _b.length; i++) {
            decimal += uint(uint8(_b[i]) * 16 ** (2 * (_b.length - 1 - i)));
        }

        return decimal;
    }
}