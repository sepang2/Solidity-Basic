// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract BOOL {
    bool isFun;

    function Fun() public {
        isFun = true;
    }

    function notFun() public {
        isFun = false;
    }

    function reverse() public {
        isFun = !isFun;
    }

    function setFun(bool _a) public {
        isFun = _a;
    }

    function getFun() public view returns(bool) {
        return isFun;
    }
}