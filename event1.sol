// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract EVENT1 {
    event ADD(string name, uint256 result);
    event SUB(string name, uint256 result);
    event MUL(string name, uint256 result);
    event DIV(string name, uint256 result);

    function add(uint256 _a, uint256 _b) public returns (uint256) {
        emit ADD("Plus", _a + _b);
        return _a + _b;
    }

    function sub(uint256 _a, uint256 _b) public returns (uint256) {
        emit SUB("Minus", _a - _b);
        return _a - _b;
    }

    function mul(uint256 _a, uint256 _b) public returns (uint256) {
        emit MUL("Times", _a * _b);
        return _a * _b;
    }

    function div(uint256 _a, uint256 _b) public returns (uint256) {
        emit DIV("Divide", _a / _b);
        return _a / _b;
    }
}

contract EVENT2 {
    event higherThanTen(uint a);

    function add(uint _a, uint _b) public {
        uint _c = _a + _b;
        if(_c >= 10) {
            emit higherThanTen(_c);
        }
    }
}

