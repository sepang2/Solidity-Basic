// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract A {
    uint public a =100;
}

contract B {
    uint public a = 100;
    uint public b = 200;
}

contract C {
    function codeLength(address _addr) public view returns(uint) {
        return _addr.code.length;
    }
}