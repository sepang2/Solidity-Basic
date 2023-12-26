// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ABIENCODEPACKED {
    /*
    1. a 넣고 결과 비교
    2. getBytes, getabiEncodePacked에 각각 1자리, 2자리, 4자리, 31자리, 32자리, 33자리,
    63자리, 64자리, 65자리 넣고 execution cost 비교해보기
    */
    function getBytes(string memory _s) public pure returns(bytes memory) {
        return bytes(_s);
    }

    function getabiEncodePacked(string memory _s) public pure returns(bytes memory) {
        return abi.encodePacked(_s);
    }

    function getabiEncode(string memory _s) public pure returns(bytes memory) {
        return abi.encode(_s);
    }
}