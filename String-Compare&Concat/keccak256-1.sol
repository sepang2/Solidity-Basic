// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract HASH {
    function kec(string memory _a) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_a));
    }

    function kec2(string memory _a, string memory _b) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_a, _b));
    }
}