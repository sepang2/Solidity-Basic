// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract EVENT_EMIT {
    event ADD(string add, uint result);
    event SUB(string sub, uint result);
    event MUL(string mul, uint result);
    event DIV(string div, uint result);

    function add (uint _a, uint _b) public returns(uint _c) {
        _c = _a + _b;
        emit ADD("Plus", _c);
    }

    function sub(uint _a, uint _b) public returns(uint _c) {
        _c = _a - _b;
        emit SUB("Minus", _c);
    }

    function mul(uint _a, uint _b) public returns(uint _c) {
        _c = _a * _b;
        emit MUL("Times", _c);
    }

    function div(uint _a, uint _b) public returns(uint _c) {
        _c = _a / _b;
        emit DIV("Divided", _c);
    }
}

contract indexed_event {
    event index_1(uint indexed _num, string _name);

    function event_1(uint _n, string memory _s) public {
        emit index_1(_n, _s);
    }
}