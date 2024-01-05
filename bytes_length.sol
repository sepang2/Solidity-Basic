// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// bytes 자체로 arr처럼 사용할 수 있음
contract BYTES_Length {
    function getBytes(bytes memory _b, uint _n) public pure returns(bytes1) {
        return _b[_n - 1];
    }
}