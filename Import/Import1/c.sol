// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract CCC {
    function multiply(uint _a, uint _b) public pure returns(uint) {
        return _a * _b;
    }

    function multiply(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a * _b * _c;
    }
}

contract CCC2 {
    function power(uint _a, uint _b) public pure returns(uint) {
        return _a**_b;
    }
}